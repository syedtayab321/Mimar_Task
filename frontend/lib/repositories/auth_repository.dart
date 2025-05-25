import '../config/constants.dart';
import '../models/auth_model.dart';
import '../services/api_services.dart';
import '../services/storage_service.dart';

class AuthRepository {
  final ApiService _apiService = ApiService();
  final StorageService _storageService = StorageService();

  Future<Auth> login(String email, String password) async {
    try {
      final response = await _apiService.post(
        AppConstants.loginUrl,
        {'email': email, 'password': password},
      );

      final user = Auth.fromJson(response['data']);
      await _storageService.saveToken(user.token);
      await _storageService.saveUserData(user.toJson());
      return user;
    } catch (e) {
      rethrow;
    }
  }

  Future<Auth> signup(String name, String email, String password) async {
    try {
      final response = await _apiService.post(
        AppConstants.signupUrl,
        {'name': name, 'email': email, 'password': password},
      );

      final user = Auth.fromJson(response['data']);
      await _storageService.saveToken(user.token);
      await _storageService.saveUserData(user.toJson());
      return user;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async {
    await _storageService.removeToken();
    await _storageService.clearUserData();
  }

  Future<bool> isLoggedIn() async {
    final token = await _storageService.getToken();
    return token != null;
  }
}