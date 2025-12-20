import 'package:travel_planner/core/model/usermodel.dart';
import 'package:travel_planner/feature/itineraryday/data/model/itineraraydaymodel.dart';

class HomescreenResponse {
  final int id;
  final String country;
  final String startDay;
  final int days;
  final double budget;
  final List<ItineraryDayResponse> itineraryDays;
  final UserResponse user;

  HomescreenResponse({
    required this.id,
    required this.country,
    required this.startDay,
    required this.days,
    required this.budget,
    required this.itineraryDays,
    required this.user,
  });

  factory HomescreenResponse.fromJson(Map<dynamic, dynamic> json) {
    return HomescreenResponse(
      id: json['data']['id'],
      country: json['data']['country'],
      startDay: json['data']['start_day'],
      days: json['data']['days'],
      budget: double.parse(json['data']['budget'].toString()),
      itineraryDays: json['data']['itineraryDay'] != null
          ? List<ItineraryDayResponse>.from(
              json['data']['itineraryDay'].map(
                (x) => ItineraryDayResponse.fromJson(x),
              ),
            )
          : [],
      user: UserResponse.fromJson(json['data']['user']),
    );
  }
}
