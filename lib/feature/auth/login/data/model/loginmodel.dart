class LoginResponse {
  final String token;
  final String name;
  final String email;
  final String phoneNumber;
  final String role;

  LoginResponse({
    required this.token,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.role,
  });

  factory LoginResponse.fromJson(Map json) {
    return LoginResponse(
      token: json['token'],
      name: json['data']['name'],
      email: json['data']['email'],
      phoneNumber: json['data']['email'],
      role: json['data']['email'],
    );
  }
}
