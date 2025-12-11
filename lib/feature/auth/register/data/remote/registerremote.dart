import 'package:dartz/dartz.dart';
import 'package:travel_planner/core/network/api_crud.dart';
import 'package:travel_planner/core/network/api_error_model.dart';
import 'package:travel_planner/core/network/api_link.dart';
import 'package:travel_planner/feature/auth/register/data/model/registermodel.dart';

class Registerdata {
  final Crud crud;
  Registerdata(this.crud);

  Future<Either<Failure, RegisterResponse>> register(
    String name,
    String email,
    String password,
    String confpassword,
    String phonenumber,
  ) async {
    var response = await crud.postData(ApiLink.register, {
      "name": name,
      "email": email,
      "password": password,
      "confirmation_password": confpassword,
      "phone_number": phonenumber,
    });
    return response.fold(
      (l) => Left(l),
      (r) => Right(RegisterResponse.fromJson(r)),
    );
  }
}
