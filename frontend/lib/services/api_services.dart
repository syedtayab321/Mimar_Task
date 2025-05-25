import 'dart:convert';
import 'package:frontend/services/storage_service.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final StorageService _storageService = StorageService();

  Future<dynamic> get(String url, {Map<String, String>? headers}) async {
    try {
      final token = await _storageService.getToken();
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
          ...?headers,
        },
      );

      return _handleResponse(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> post(String url, dynamic body,
      {Map<String, String>? headers}) async {
    try {
      final token = await _storageService.getToken();
      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode(body),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': token != null ? 'Bearer $token' : '',
          ...?headers,
        },
      );

      return _handleResponse(response);
    } catch (e) {
      rethrow;
    }
  }

  dynamic _handleResponse(http.Response response) {
    final responseJson = jsonDecode(response.body);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return responseJson;
    } else {
      throw Exception(responseJson['message'] ?? 'Something went wrong');
    }
  }
}