import express from 'express';
import { authenticate } from '../middlewares/auth.middleware.js';
import { getWeather } from '../controllers/weather.controller.js';

const router = express.Router();

router.get('/', authenticate, getWeather);

export default router;