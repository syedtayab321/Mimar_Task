# Weather & Quote App

A cross-platform mobile app with Flutter frontend and Node.js backend that displays weather information, random quotes, and includes a text generation feature using Google Gemini API.

## Features

- User authentication (login/signup)
- Weather information by city
- Random motivational quotes
- Text generation with Google Gemini
- User management table

## Technologies Used

### Backend
- Node.js
- Express.js
- MongoDB
- JWT for authentication
- OpenWeatherMap API
- Quotable API
- Google Gemini API

### Frontend
- Flutter
- Provider for state management
- HTTP for API calls
- Shared Preferences for local storage

## Setup Instructions

### Backend Setup

1. Install Node.js (v14 or higher)
2. Install MongoDB and make sure it's running
3. Clone the repository
4. Navigate to the backend directory:
   ```bash
   cd backend
5. Make sure your Mongodb is runing on mongodb://127.0.0.1:27017/
6. change database name in .env file in backend 
Access locally: http://localhost:5000
Access on network: http://192.168.190.18:5000

Replace the local Ip address with your LocalIP address in .env file in frontend and server.js file in the backend 


# Project Dependencies

## Frontend (Flutter) Packages

### Core Dependencies
- `flutter`: SDK for Flutter framework
- `cupertino_icons`: ^1.0.8 - iOS-style icons
- `get`: ^4.7.2 - State management and navigation
- `http`: ^1.4.0 - HTTP client for API calls
- `intl`: ^0.20.2 - Internationalization and localization
- `shared_preferences`: ^2.5.3 - Persistent local storage
- `provider`: ^6.1.5 - State management solution
- `cached_network_image`: ^3.4.1 - Image caching
- `google_generative_ai`: ^0.4.7 - Google's generative AI integration
- `flutter_riverpod`: ^2.6.1 - State management with Riverpod
- `flutter_dotenv`: ^5.2.1 - Environment variables loader

### Development Dependencies
- `flutter_test`: Flutter testing utilities
- `flutter_lints`: ^4.0.0 - Recommended lint rules

## Backend (Node.js) Packages

### Core Dependencies
- `bcryptjs`: ^3.0.2 - Password hashing
- `cors`: ^2.8.5 - Cross-Origin Resource Sharing middleware
- `dotenv`: ^16.5.0 - Environment variables loader
- `express`: ^5.1.0 - Web application framework
- `express-async-handler`: ^1.2.0 - Async error handling for Express
- `jsonwebtoken`: ^9.0.2 - JSON Web Token implementation
- `mongoose`: ^8.15.0 - MongoDB object modeling
- `morgan`: ^1.10.0 - HTTP request logger
- `node-fetch`: ^3.3.2 - Fetch API for Node.js

### Development Dependencies
- `cross-env`: ^7.0.3 - Cross-platform environment variables
- `jest`: ^29.7.0 - Testing framework
- `nodemon`: ^3.1.10 - Development server with hot reload
- `supertest`: ^7.1.1 - HTTP assertion testing
