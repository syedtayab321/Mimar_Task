import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/quote_model.dart';
import '../models/auth_model.dart';
import '../models/user_model.dart';
import '../models/weather_model.dart';
import '../repositories/home_repository.dart';

final weatherProvider = FutureProvider.autoDispose.family<Weather, String>((ref, city) async {
  return ref.read(homeRepositoryProvider).getWeather(city);
});

final quoteProvider = FutureProvider.autoDispose<Quote>((ref) async {
  return ref.read(homeRepositoryProvider).getQuote();
});

final usersProvider = FutureProvider.autoDispose<List<User>>((ref) async {
  return ref.read(homeRepositoryProvider).getUsers();
});

// Providers
final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  return HomeRepository();
});