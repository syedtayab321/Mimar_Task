class Weather {
  final String city;
  final String country;
  final double temperature;
  final double feelsLike;
  final int humidity;
  final double windSpeed;
  final String description;
  final String icon;

  Weather({
    required this.city,
    required this.country,
    required this.temperature,
    required this.feelsLike,
    required this.humidity,
    required this.windSpeed,
    required this.description,
    required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      city: json['city'],
      country: json['country'],
      temperature: json['temperature'].toDouble(),
      feelsLike: json['feelsLike'].toDouble(),
      humidity: json['humidity'],
      windSpeed: json['windSpeed'].toDouble(),
      description: json['description'],
      icon: json['icon'],
    );
  }
}