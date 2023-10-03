import 'dart:convert';

class AuthRequestModel {
  final String email;
  final String password;
  AuthRequestModel({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }

  factory AuthRequestModel.fromMap(Map<String, dynamic> map) {
    return AuthRequestModel(
      email: map['email'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthRequestModel.fromJson(String source) =>
      AuthRequestModel.fromMap(json.decode(source));
}
