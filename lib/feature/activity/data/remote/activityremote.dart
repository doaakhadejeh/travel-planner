import 'package:dartz/dartz.dart';
import 'package:travel_planner/core/network/api_crud.dart';
import 'package:travel_planner/core/network/api_error_model.dart';
import 'package:travel_planner/core/network/api_link.dart';
import 'package:travel_planner/feature/activity/data/model/activitymodel.dart';

class Activitydata {
  final Crud crud;
  Activitydata(this.crud);

  Future<Either<Failure, List<ActivityResponse>>> getActivity(int dayId) async {
    var response = await crud.getData(ApiLink.showActivities(dayId));
    return response.fold((l) => Left(l), (r) {
      final List<dynamic> data = r['data'];
      final activities = data.map((e) => ActivityResponse.fromJson(e)).toList();
      return Right(activities);
    });
  }
}
