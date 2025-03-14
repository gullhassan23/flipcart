import 'dart:convert';

class User {
  final String name;
  final String email;
  final String password;
  final String id;
  final String address;
  final String role;
  final String token;
  User({
    required this.name,
    required this.email,
    required this.password,
    required this.id,
    required this.address,
    required this.role,
    required this.token,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'id': id,
      'address': address,
      'role': role,
      'token': token,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      id: map['id'] ?? '',
      address: map['address'] ?? '',
      role: map['role'] ?? '',
      token: map['token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
