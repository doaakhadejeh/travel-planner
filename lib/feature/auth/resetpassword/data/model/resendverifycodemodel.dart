class ResendCodeResponse {
  final String message;

  ResendCodeResponse({required this.message});

  factory ResendCodeResponse.fromJson(Map json) {
    return ResendCodeResponse(message: json['message']);
  }
}
