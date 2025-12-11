class ForgetPasswordResponse {
  final String message;

  ForgetPasswordResponse({required this.message});

  factory ForgetPasswordResponse.fromJson(Map json) {
    return ForgetPasswordResponse(message: json['message']);
  }
}
