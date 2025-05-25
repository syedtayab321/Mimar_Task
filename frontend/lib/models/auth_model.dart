class Auth {
  final String id;
  final String name;
  final String email;
  final String token;

  Auth({
    required this.id,
    required this.name,
    required this.email,
    required this.token,
  });

  factory Auth.fromJson(Map<String, dynamic> json) {
    return Auth(
      id: json['_id'] ?? json['id'],
      name: json['name'],
      email: json['email'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'token': token,
  };
}