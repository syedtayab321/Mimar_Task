import express from 'express';
import { authenticate } from '../middlewares/auth.middleware.js';
import { getUsers } from '../controllers/user.controller.js';

const router = express.Router();

// Protected admin route
router.get('/', authenticate, getUsers);

export default router;