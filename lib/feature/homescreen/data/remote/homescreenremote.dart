import 'package:dartz/dartz.dart';
import 'package:travel_planner/core/network/api_crud.dart';
import 'package:travel_planner/core/network/api_error_model.dart';
import 'package:travel_planner/core/network/api_link.dart';
import 'package:travel_planner/feature/homescreen/data/model/homescreenmodel.dart';

class Homescreendata {
  final Crud crud;
  Homescreendata(this.crud);

  Future<Either<Failure, HomescreenResponse>> generateTrip(
    String country,
    int days,
    double budget,
  ) async {
    var response = await crud.postData(ApiLink.generateTrip, {
      "country": country,
      "days": days,
      "budget": budget,
    });
    return response.fold(
      (l) => Left(l),
      (r) => Right(HomescreenResponse.fromJson(r)),
    );
  }
}
