import { asyncHandler } from '../utils/asyncHandler.js';
import { successResponse } from '../utils/apiResponse.js';
import { generateText } from '../services/external/gemini.service.js';

export const generateGeminiText = asyncHandler(async (req, res) => {
  const { prompt } = req.body;
  
  if (!prompt) {
    throw new Error('Prompt is required');
  }
  
  const generatedText = await generateText(prompt);
  
  successResponse(res, 200, { generatedText }, 'Text generated successfully');
});