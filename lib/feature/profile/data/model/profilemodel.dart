class ProfileResponse {
  final int id;
  final String name;
  final String email;
  final String password;
  final String role;
  final String profileImage;
  final String phoneNumber;
  final int isBlocked;

  ProfileResponse({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.role,
    required this.profileImage,
    required this.isBlocked,
    required this.phoneNumber,
  });

  factory ProfileResponse.fromJson(Map<dynamic, dynamic> json) {
    return ProfileResponse(
      id: json['data']['id'],
      name: json['data']['name'],
      email: json['data']['email'],
      password: json['data']['password'],
      role: json['data']['role'],
      profileImage: json['data']['profile_image'] ?? '',
      isBlocked: json['data']['is_blocked'],
      phoneNumber: json['data']['phone_number'],
    );
  }
}
