class UserPreferenceResponse {
  final int id;
  final String travelStyle;
  final String preferredBudgetMin;
  final String preferredBudgetMax;
  final String preferredFood;

  final String preferredCountries;
  final String interests;

  final String lastUpdateAt;

  UserPreferenceResponse({
    required this.id,
    required this.lastUpdateAt,
    required this.travelStyle,
    required this.preferredBudgetMin,
    required this.preferredBudgetMax,
    required this.preferredFood,
    required this.preferredCountries,
    required this.interests,
  });

  factory UserPreferenceResponse.fromJson(Map<String, dynamic> json) {
    return UserPreferenceResponse(
      id: json['id'],
      travelStyle: json['travel_style'],
      preferredBudgetMin: json['preferred_budget_min'].toString(),
      preferredBudgetMax: json['preferred_budget_max'].toString(),

      preferredCountries: json['preferred_countries'],
      preferredFood: json['preferred_food'],
      interests: json['interests'],
      lastUpdateAt: json['last_update_at'],
    );
  }
}
