class AppConstants {
  static const String appName = 'Flutter App';

  // API
  static const String baseUrl = 'http://192.168.190.18:5000/api';
  static const String loginUrl = '$baseUrl/auth/login';
  static const String signupUrl = '$baseUrl/auth/signup';
  static const String weatherUrl = '$baseUrl/weather';
  static const String quoteUrl = '$baseUrl/quote';
  static const String geminiUrl = '$baseUrl/gemini';
  static const String usersUrl = '$baseUrl/users';

  // Storage
  static const String tokenKey = 'auth_token';
  static const String userKey = 'user_data';

  // Validation
  static const String emailRegex = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  static const String passwordRegex = r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$';
}