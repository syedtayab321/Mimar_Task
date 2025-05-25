import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../controllers/gemini_controller.dart';
import '../../widgets/custom_button.dart';

class GeminiSection extends ConsumerWidget {
  const GeminiSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final geminiController = ref.watch(geminiControllerProvider.notifier);
    final state = ref.watch(geminiControllerProvider);

    return Card(
      elevation: 0,
      color: theme.colorScheme.primaryContainer.withOpacity(0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.auto_awesome_rounded,
                  color: theme.colorScheme.primary,
                  size: 28,
                ),
                const SizedBox(width: 12),
                Text(
                  'AI Assistant',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Generate creative content with our AI-powered assistant',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withOpacity(0.8),
              ),
            ),
            const SizedBox(height: 20),

            // State handling with AsyncValue
            state.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  'Error: ${error.toString()}',
                  style: TextStyle(color: theme.colorScheme.error),
                ),
              ),
              data: (generatedText) => Column(
                children: [
                  if (generatedText.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Text(generatedText),
                    ),
                  CustomButton(
                    text: 'Generate Text with Gemini',
                    onPressed: () {
                      geminiController.generateText("Generate a creative marketing slogan");
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}