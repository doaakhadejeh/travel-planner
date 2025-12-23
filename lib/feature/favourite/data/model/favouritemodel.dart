import 'package:travel_planner/feature/trip/data/model/tripmodel.dart';

class FavouriteResponse {
  final int id;
  final bool isFavourite;
  final TripResponse trip;

  FavouriteResponse({
    required this.id,
    required this.trip,
    required this.isFavourite,
  });

  factory FavouriteResponse.fromJson(Map<dynamic, dynamic> json) {
    return FavouriteResponse(
      id: json['id'],
      isFavourite: json['is_favorite'] ?? false,
      trip: TripResponse.fromJson(json['trip']),
    );
  }
}
