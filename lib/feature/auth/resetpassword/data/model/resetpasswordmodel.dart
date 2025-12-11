class ResetPasswordResponse {
  final String message;

  ResetPasswordResponse({required this.message});

  factory ResetPasswordResponse.fromJson(Map json) {
    return ResetPasswordResponse(message: json['message']);
  }
}
