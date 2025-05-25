import express from 'express';
import { authenticate } from '../middlewares/auth.middleware.js';
import { generateGeminiText } from '../controllers/gemini.controller.js';

const router = express.Router();

router.post('/', authenticate, generateGeminiText);

export default router;