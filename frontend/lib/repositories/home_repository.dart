import '../config/constants.dart';
import '../models/quote_model.dart';
import '../models/auth_model.dart';
import '../models/user_model.dart';
import '../models/weather_model.dart';
import '../services/api_services.dart';

class HomeRepository {
  final ApiService _apiService = ApiService();

  Future<Weather> getWeather(String city) async {
    try {
      final response = await _apiService.get(
        '${AppConstants.weatherUrl}?city=$city',
      );
      return Weather.fromJson(response['data']);
    } catch (e) {
      rethrow;
    }
  }

  Future<Quote> getQuote() async {
    try {
      final response = await _apiService.get(AppConstants.quoteUrl);
      return Quote.fromJson(response['data']);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<User>> getUsers() async {
    try {
      final response = await _apiService.get(AppConstants.usersUrl);

      // Debug print to verify structure
      print('API Response: $response');

      if (response is Map<String, dynamic>) {
        // Check if data exists and is the expected type
        if (response['data'] is Map<String, dynamic>) {
          final data = response['data'] as Map<String, dynamic>;

          // Check if users list exists
          if (data['users'] is List) {
            final usersList = data['users'] as List;

            return usersList.map((userJson) {
              try {
                return User.fromJson(userJson as Map<String, dynamic>);
              } catch (e) {
                print('Error parsing user: $e\nUser JSON: $userJson');
                throw Exception('Failed to parse user data');
              }
            }).toList();
          } else {
            throw Exception('Users list not found in response');
          }
        } else {
          throw Exception('Invalid data format in response');
        }
      } else {
        throw Exception('Invalid response format');
      }
    } catch (e) {
      print('Error in getUsers: $e');
      rethrow;
    }
  }
}