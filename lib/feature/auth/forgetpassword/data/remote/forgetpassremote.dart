import 'package:dartz/dartz.dart';
import 'package:travel_planner/core/network/api_crud.dart';
import 'package:travel_planner/core/network/api_error_model.dart';
import 'package:travel_planner/core/network/api_link.dart';
import 'package:travel_planner/feature/auth/forgetpassword/data/model/forgetpasswordmodel.dart';

class Forgetpassdata {
  final Crud crud;
  Forgetpassdata(this.crud);

  Future<Either<Failure, ForgetPasswordResponse>> forgetPassword(
    String email,
  ) async {
    var response = await crud.postData(ApiLink.forgotPassword, {
      "email": email,
    });
    return response.fold(
      (l) => Left(l),
      (r) => Right(ForgetPasswordResponse.fromJson(r)),
    );
  }
}
