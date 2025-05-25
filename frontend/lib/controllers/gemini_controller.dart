import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/gemini_repository.dart';

final geminiControllerProvider = StateNotifierProvider<GeminiController, AsyncValue<String>>((ref) {
  return GeminiController(ref);
});

class GeminiController extends StateNotifier<AsyncValue<String>> {
  final Ref ref;
  GeminiController(this.ref) : super(const AsyncValue.data(''));

  Future<void> generateText(String prompt) async {
    state = const AsyncValue.loading();
    try {
      final text = await ref.read(geminiRepositoryProvider).generateTextWithApi(prompt);
      state = AsyncValue.data(text);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      rethrow;
    }
  }
}

// Providers
final geminiRepositoryProvider = Provider<GeminiRepository>((ref) {
  return GeminiRepository();
});