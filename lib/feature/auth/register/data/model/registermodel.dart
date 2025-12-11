class RegisterResponse {
  final String name;
  final String email;
  final String phoneNumber;
  final String role;

  RegisterResponse({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.role,
  });

  factory RegisterResponse.fromJson(Map json) {
    return RegisterResponse(
      name: json['data']['name'],
      email: json['data']['email'],
      phoneNumber: json['data']['phone_number'],
      role: json['data']['role'],
    );
  }
}
