import 'package:google_generative_ai/google_generative_ai.dart';
import '../config/constants.dart';
import '../services/api_services.dart';

class GeminiRepository {
  final ApiService _apiService = ApiService();

  // Option 1: Using our backend API
  Future<String> generateTextWithApi(String prompt) async {
    try {
      final response = await _apiService.post(
        AppConstants.geminiUrl,
        {'prompt': prompt},
      );
      return response['data']['generatedText'];
    } catch (e) {
      rethrow;
    }
  }

  // Option 2: Directly using Gemini API from Flutter
  Future<String> generateTextDirectly(String prompt) async {
    try {
      final model = GenerativeModel(
        model: 'gemini-pro',
        apiKey: const String.fromEnvironment('GEMINI_API_KEY'),
      );
      final content = Content.text(prompt);
      final response = await model.generateContent([content]);
      return response.text ?? 'No response from Gemini';
    } catch (e) {
      rethrow;
    }
  }
}