import { ApiError } from '../utils/apiError.js';
import { errorResponse } from '../utils/apiResponse.js';

export const errorMiddleware = (err, req, res, next) => {
  err.statusCode = err.statusCode || 500;
  err.message = err.message || 'Internal Server Error';

  // Wrong Mongodb Id error
  if (err.name === 'CastError') {
    const message = `Resource not found. Invalid: ${err.path}`;
    err = new ApiError(400, message);
  }

  // Mongoose duplicate key error
  if (err.code === 11000) {
    const message = `Duplicate ${Object.keys(err.keyValue)} entered`;
    err = new ApiError(400, message);
  }

  // Wrong JWT error
  if (err.name === 'JsonWebTokenError') {
    const message = 'Json Web Token is invalid, try again';
    err = new ApiError(400, message);
  }

  // JWT EXPIRE error
  if (err.name === 'TokenExpiredError') {
    const message = 'Json Web Token is expired, try again';
    err = new ApiError(400, message);
  }

  errorResponse(
    res,
    err.statusCode,
    err.message,
    process.env.NODE_ENV === 'development' ? err.stack : null
  );
};