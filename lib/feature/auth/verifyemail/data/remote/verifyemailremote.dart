import 'package:dartz/dartz.dart';
import 'package:travel_planner/core/network/api_crud.dart';
import 'package:travel_planner/core/network/api_error_model.dart';
import 'package:travel_planner/core/network/api_link.dart';
import 'package:travel_planner/feature/auth/resetpassword/data/model/resendverifycodemodel.dart';
import 'package:travel_planner/feature/auth/verifyemail/data/model/verifyemailmodel.dart';

class Verifyemaildata {
  final Crud crud;
  Verifyemaildata(this.crud);

  Future<Either<Failure, VerifyEmailResponse>> verifyEmail(
    String email,
    String code,
  ) async {
    var response = await crud.postData(ApiLink.verifyCode, {
      "email": email,
      "code": code,
    });
    return response.fold(
      (l) => Left(l),
      (r) => Right(VerifyEmailResponse.fromJson(r)),
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
