import 'package:dartz/dartz.dart';
import 'package:travel_planner/core/network/api_crud.dart';
import 'package:travel_planner/core/network/api_error_model.dart';
import 'package:travel_planner/core/network/api_link.dart';
import 'package:travel_planner/feature/userpreferences/data/model/userpreferencesmodel.dart';

class Userpreferencesdata {
  final Crud crud;
  Userpreferencesdata(this.crud);

  Future<Either<Failure, List<UserPreferenceResponse>>> getPreferences() async {
    final response = await crud.getData(ApiLink.getPreference);

    return response.fold((l) => Left(l), (r) {
      final list = (r['data'] as List)
          .map((e) => UserPreferenceResponse.fromJson(e))
          .toList();
      return Right(list);
    });
  }

  Future<Either<Failure, UserPreferenceResponse>> addPreference(
    Map<dynamic, dynamic> data,
  ) async {
    final response = await crud.postData(ApiLink.storePreference, data);

    return response.fold(
      (l) => Left(l),
      (r) => Right(UserPreferenceResponse.fromJson(r['data'])),
    );
  }

  Future<Either<Failure, UserPreferenceResponse>> updatePreference(
    int id,
    Map<dynamic, dynamic> data,
  ) async {
    final response = await crud.putData(ApiLink.updatePreference(id), data);

    return response.fold(
      (l) => Left(l),
      (r) => Right(UserPreferenceResponse.fromJson(r['data'])),
    );
  }

  Future<Either<Failure, Unit>> deletePreference(int id) async {
    final response = await crud.deleteData(ApiLink.destroyPreference(id));

    return response.fold((l) => Left(l), (_) => const Right(unit));
  }
}
