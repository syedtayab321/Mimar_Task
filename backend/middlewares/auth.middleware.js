import { verifyToken } from '../config/jwt.js';
import { ApiError } from '../utils/apiError.js';
import asyncHandler from 'express-async-handler';

export const authenticate = asyncHandler(async (req, res, next) => {
  let token;
  
  if (
    req.headers.authorization &&
    req.headers.authorization.startsWith('Bearer')
  ) {
    token = req.headers.authorization.split(' ')[1];
  }

  if (!token) {
    throw new ApiError(401, 'Not authorized to access this route');
  }

  try {
    const decoded = verifyToken(token);
    req.user = decoded.userId;
    next();
  } catch (error) {
    throw new ApiError(401, 'Not authorized, token failed');
  }
});