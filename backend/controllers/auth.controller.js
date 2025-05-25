import { asyncHandler } from '../utils/asyncHandler.js';
import { successResponse } from '../utils/apiResponse.js';
import { registerUser, loginUser } from '../services/user.service.js';

export const register = asyncHandler(async (req, res) => {
  const { name, email, password } = req.body;
  
  const user = await registerUser(name, email, password);
  
  successResponse(res, 201, user, 'User registered successfully');
});

export const login = asyncHandler(async (req, res) => {
  const { email, password } = req.body;
  
  const user = await loginUser(email, password);
  
  successResponse(res, 200, user, 'User logged in successfully');
});