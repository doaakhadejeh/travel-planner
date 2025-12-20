import 'package:dartz/dartz.dart';
import 'package:travel_planner/core/network/api_crud.dart';
import 'package:travel_planner/core/network/api_error_model.dart';
import 'package:travel_planner/core/network/api_link.dart';
import 'package:travel_planner/feature/auth/resetpassword/data/model/resendverifycodemodel.dart';
import 'package:travel_planner/feature/auth/resetpassword/data/model/resetpasswordmodel.dart';

class Resetpassdata {
  final Crud crud;
  Resetpassdata(this.crud);

  Future<Either<Failure, ResetPasswordResponse>> resetPassword(
    String email,
    String password,
    String confPassword,
    String code,
  ) async {
    var response = await crud.postData(ApiLink.resetPassword, {
      "email": email,
      "password": password,
      "password_confirmation": confPassword,
      "code": code,
    });
    return response.fold(
      (l) => Left(l),
      (r) => Right(ResetPasswordResponse.fromJson(r)),
    );
  }

  Future<Either<Failure, ResendCodeResponse>> resendVerifyCode(
    String email,
  ) async {
    var response = await crud.postData(ApiLink.resendVerificationCode, {
      "email": email,
    });
    return response.fold(
      (l) => Left(l),
      (r) => Right(ResendCodeResponse.fromJson(r)),
    );
  }
}
