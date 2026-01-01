class UserResponse {
  final int id;
  final String name;
  final String email;
  String? password;
  String? role;
  String? profileImage;
  String? phoneNumber;
  int? isBlocked;

  UserResponse({
    required this.id,
    required this.name,
    required this.email,
    this.password,
    this.role,
    this.profileImage,
    this.phoneNumber,
    this.isBlocked,
  });

  factory UserResponse.fromJson(Map<dynamic, dynamic> json) {
    return UserResponse(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'] ?? '',
      role: json['role'] ?? 'user',
      profileImage: json['profile_image'] ?? '',
      phoneNumber: json['phone_number'] ?? '',
      isBlocked: json['is_blocked'] == true ? 1 : 0,
    );
  }
}
