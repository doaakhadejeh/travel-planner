import 'package:travel_planner/core/model/usermodel.dart';
import 'package:travel_planner/feature/itineraryday/data/model/itineraraydaymodel.dart';

class TripResponse {
  final int id;
  final String country;
  final DateTime startDay;
  final int days;
  final double budget;
  bool isFavourite;
  final List<ItineraryDayResponse> itineraryDays;
  final UserResponse user;

  TripResponse({
    required this.id,
    required this.country,
    required this.startDay,
    required this.days,
    required this.budget,
    required this.itineraryDays,
    required this.user,
    required this.isFavourite,
  });

  factory TripResponse.fromJson(Map<dynamic, dynamic> json) {
    return TripResponse(
      id: json['id'],
      country: json['country'],
      startDay: DateTime.tryParse(json['start_day']) ?? DateTime.now(),
      days: json['days'],
      budget: double.parse(json['budget'].toString()),
      itineraryDays: json['itineraryDay'] != null
          ? List<ItineraryDayResponse>.from(
              json['itineraryDay'].map((x) => ItineraryDayResponse.fromJson(x)),
            )
          : [],
      user: UserResponse.fromJson(json['user']),
      isFavourite: false,
    );
  }
}
