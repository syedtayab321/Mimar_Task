import express from 'express';
import { authenticate } from '../middlewares/auth.middleware.js';
import { getQuote } from '../controllers/quote.controller.js';

const router = express.Router();

router.get('/', authenticate, getQuote);

export default router;