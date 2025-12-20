class FavouriteResponse {
  // final String token;
  final String name;
  // final String email;
  // final String phoneNumber;
  // final String role;

  FavouriteResponse({
    // required this.token,
    required this.name,
    // required this.email,
    // required this.phoneNumber,
    // required this.role,
  });

  factory FavouriteResponse.fromJson(Map json) {
    return FavouriteResponse(
      // token: json['token'],
      name: json['data']['name'],
      // email: json['data']['email'],
      // phoneNumber: json['data']['email'],
      // role: json['data']['email'],
    );
  }
}
