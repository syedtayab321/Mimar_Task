import { asyncHandler } from '../utils/asyncHandler.js';
import { successResponse } from '../utils/apiResponse.js';
import { getAllUsers } from '../services/user.service.js';

export const getUsers = asyncHandler(async (req, res) => {
  const page = parseInt(req.query.page) || 1;
  const limit = parseInt(req.query.limit) || 10;
  
  const { users, pagination } = await getAllUsers(page, limit);
  
  successResponse(res, 200, {
    users,
    pagination
  }, 'Users fetched successfully');
});