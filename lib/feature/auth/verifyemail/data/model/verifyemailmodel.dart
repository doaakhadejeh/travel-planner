class VerifyEmailResponse {
  final String name;
  final int id;
  final String email;

  VerifyEmailResponse({
    required this.name,
    required this.id,
    required this.email,
  });

  factory VerifyEmailResponse.fromJson(Map json) {
    return VerifyEmailResponse(
      id: json['data']['id'],
      name: json['data']['name'],
      email: json['data']['email'],
    );
  }
}
