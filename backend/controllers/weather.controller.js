import { asyncHandler } from '../utils/asyncHandler.js';
import { successResponse } from '../utils/apiResponse.js';
import { getWeatherByCity } from '../services/external/weather.service.js';

export const getWeather = asyncHandler(async (req, res) => {
  const { city } = req.query;
  
  if (!city) {
    throw new Error('City parameter is required');
  }
  
  const weatherData = await getWeatherByCity(city);
  
  successResponse(res, 200, weatherData, 'Weather data fetched successfully');
});