import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../controllers/auth_controller.dart';
import '../../controllers/gemini_controller.dart';
import '../../routes/app_routes.dart';
import '../widgets/custom_button.dart';
import 'components/gemini_section.dart';
import 'components/quote_card.dart';
import 'components/user_table.dart';
import 'components/weather_card.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final _cityController = TextEditingController(text: 'London');
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _cityController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _logout() async {
    try {
      await ref.read(authControllerProvider.notifier).logout();
      if (mounted) {
        Navigator.pushReplacementNamed(context, AppRoutes.login);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString()),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      }
    }
  }

  Widget _buildSectionHeader(String title, IconData icon, ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        children: [
          Icon(icon, color: theme.colorScheme.primary, size: 28),
          const SizedBox(width: 12),
          Text(
            title,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      height: 40,
      thickness: 1,
      color: Colors.grey.withOpacity(0.2),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.logout, color: theme.colorScheme.onPrimary),
            onPressed: _logout,
            tooltip: 'Logout',
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {});
          await Future.delayed(const Duration(milliseconds: 500));
        },
        child: SingleChildScrollView(
          controller: _scrollController,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Weather Section
              _buildSectionHeader('Weather Forecast', Icons.cloud, theme),
              Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(
                    color: theme.colorScheme.outline.withOpacity(0.2),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      TextField(
                        controller: _cityController,
                        decoration: InputDecoration(
                          labelText: 'Search city',
                          hintText: 'Enter city name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: theme.colorScheme.surfaceContainerHighest.withOpacity(0.4),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.search, color: theme.colorScheme.primary),
                            onPressed: () => setState(() {}),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                        ),
                        onSubmitted: (value) => setState(() {}),
                      ),
                      const SizedBox(height: 16),
                      WeatherCard(city: _cityController.text),
                    ],
                  ),
                ),
              ),
              _buildDivider(),

              // Quote Section
              _buildSectionHeader('Daily Inspiration', Icons.format_quote, theme),
              const QuoteCard(),
              _buildDivider(),

              // User Management Section
              _buildSectionHeader('User Management', Icons.people, theme),
              const Card(
                child: Padding(
                  padding: EdgeInsets.all(2),
                  child: UserTable(),
                ),
              ),
              _buildDivider(),

              // Gemini AI Section
              _buildSectionHeader('AI Assistant', Icons.auto_awesome_rounded, theme),
              const GeminiSection(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _scrollController.animateTo(
            0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        },
        child: const Icon(Icons.arrow_upward),
      ),
    );
  }
}