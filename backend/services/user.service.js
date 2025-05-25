import User from '../models/user.model.js';
import { generateToken } from '../config/jwt.js';

export const registerUser = async (name, email, password) => {
  const userExists = await User.findOne({ email });

  if (userExists) {
    throw new Error('User already exists');
  }

  const user = await User.create({
    name,
    email,
    password,
  });

  return {
    _id: user._id,
    name: user.name,
    email: user.email,
    token: generateToken(user._id),
  };
};

export const loginUser = async (email, password) => {
  const user = await User.findOne({ email }).select('+password');

  if (!user) {
    throw new Error('Invalid email or password');
  }

  const isMatch = await user.comparePassword(password);

  if (!isMatch) {
    throw new Error('Invalid email or password');
  }

  return {
    _id: user._id,
    name: user.name,
    email: user.email,
    token: generateToken(user._id),
  };
};

export const getAllUsers = async (page = 1, limit = 10) => {
  try {
    const skip = (page - 1) * limit;
    
    const users = await User.find()
      .select('-password -refreshToken') // Exclude sensitive fields
      .skip(skip)
      .limit(limit)
      .lean();

    const totalUsers = await User.countDocuments();
    
    return {
      users,
      pagination: {
        total: totalUsers,
        pages: Math.ceil(totalUsers / limit),
        currentPage: page,
        perPage: limit
      }
    };
  } catch (error) {
    throw new Error('Failed to fetch users');
  }
};