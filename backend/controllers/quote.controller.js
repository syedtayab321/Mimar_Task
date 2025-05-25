import { asyncHandler } from '../utils/asyncHandler.js';
import { successResponse } from '../utils/apiResponse.js';
import { getRandomQuote } from '../services/external/quote.service.js';

export const getQuote = asyncHandler(async (req, res) => {
  const quote = await getRandomQuote();
  
  successResponse(res, 200, quote, 'Quote fetched successfully');
});