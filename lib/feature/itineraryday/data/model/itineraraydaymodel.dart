import 'package:travel_planner/feature/activity/data/model/activitymodel.dart';

class ItineraryDayResponse {
  final int id;
  final int dayNumber;
  final String summary;
  final String aiResponse;
  final String aiResult;
  final List<ActivityResponse> activities;

  ItineraryDayResponse({
    required this.id,
    required this.dayNumber,
    required this.summary,
    required this.aiResponse,
    required this.aiResult,
    required this.activities,
  });

  factory ItineraryDayResponse.fromJson(Map<dynamic, dynamic> json) {
    return ItineraryDayResponse(
      id: json['id'],
      dayNumber: json['day_number'],
      summary: json['summary'],
      aiResponse: json['ai_response'],
      aiResult: json['ai_result'],
      activities: json['activities'] != null
          ? List<ActivityResponse>.from(
              json['activities'].map((x) => ActivityResponse.fromJson(x)),
            )
          : [],
    );
  }
}
