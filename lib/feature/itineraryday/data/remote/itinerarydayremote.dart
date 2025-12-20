import 'package:dartz/dartz.dart';
import 'package:travel_planner/core/network/api_crud.dart';
import 'package:travel_planner/core/network/api_error_model.dart';
import 'package:travel_planner/core/network/api_link.dart';
import 'package:travel_planner/feature/itineraryday/data/model/itineraraydaymodel.dart';

class Itinerarydaydata {
  final Crud crud;
  Itinerarydaydata(this.crud);

  Future<Either<Failure, List<ItineraryDayResponse>>> getItineraryDay(
    int tripId,
  ) async {
    var response = await crud.getData(ApiLink.showDaysTrip(tripId));
    return response.fold((l) => Left(l), (r) {
      final List<dynamic> data = r['data'];
      final activities = data
          .map((e) => ItineraryDayResponse.fromJson(e))
          .toList();
      return Right(activities);
    });
  }
}
