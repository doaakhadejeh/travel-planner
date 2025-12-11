class VerifyEmailResponse {
  final String code;
  final String email;

  VerifyEmailResponse({required this.code, required this.email});

  factory VerifyEmailResponse.fromJson(Map json) {
    return VerifyEmailResponse(
      code: json['data']['code'],
      email: json['data']['email'],
    );
  }
}
