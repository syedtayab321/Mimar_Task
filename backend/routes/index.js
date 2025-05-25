import express from 'express';
import authRoutes from './auth.routes.js';
import weatherRoutes from './weather.routes.js';
import quoteRoutes from './quote.routes.js';
import geminiRoutes from './gemini.routes.js';
import userRoutes from './user.routes.js';

const router = express.Router();

router.use('/auth', authRoutes);
router.use('/weather', weatherRoutes);
router.use('/quote', quoteRoutes);
router.use('/gemini', geminiRoutes);
router.use('/users', userRoutes);

export default router;