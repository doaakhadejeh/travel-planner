class UserPreferenceResponse {
  final int id;
  final int userId;
  final String preferenceType;
  final String value;
  final String lastUpdateAt;

  UserPreferenceResponse({
    required this.id,
    required this.userId,
    required this.preferenceType,
    required this.value,
    required this.lastUpdateAt,
  });

  factory UserPreferenceResponse.fromJson(Map<String, dynamic> json) {
    return UserPreferenceResponse(
      id: json['id'],
      userId: json['user_id'],
      preferenceType: json['preference_type'],
      value: json['value'],
      lastUpdateAt: json['last_update_at'],
    );
  }
}
