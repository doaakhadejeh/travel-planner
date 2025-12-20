import 'package:dartz/dartz.dart';
import 'package:travel_planner/core/network/api_crud.dart';
import 'package:travel_planner/core/network/api_error_model.dart';
import 'package:travel_planner/core/network/api_link.dart';
import 'package:travel_planner/feature/trip/data/model/tripmodel.dart';

class Tripdata {
  final Crud crud;
  Tripdata(this.crud);

  Future<Either<Failure, List<TripResponse>>> getUserTrip() async {
    var response = await crud.getData(ApiLink.userTrips);
    return response.fold((l) => Left(l), (r) {
      final List<dynamic> data = r['data'];
      final trips = data.map((e) => TripResponse.fromJson(e)).toList();
      return Right(trips);
    });
  }
}
