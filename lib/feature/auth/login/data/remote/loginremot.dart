import 'package:dartz/dartz.dart';
import 'package:travel_planner/core/network/api_crud.dart';
import 'package:travel_planner/core/network/api_error_model.dart';
import 'package:travel_planner/core/network/api_link.dart';
import 'package:travel_planner/feature/auth/login/data/model/loginmodel.dart';

class Logindata {
  final Crud crud;
  Logindata(this.crud);

  Future<Either<Failure, LoginResponse>> login(
    String email,
    String password,
  ) async {
    var response = await crud.postData(ApiLink.login, {
      "email": email,
      "password": password,
    });
    return response.fold(
      (l) => Left(l),
      (r) => Right(LoginResponse.fromJson(r)),
    );
  }
}
