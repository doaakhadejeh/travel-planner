import 'package:travel_planner/core/network/api_crud.dart';

class Settingdata {
  final Crud crud;
  Settingdata(this.crud);

  // Future<Either<Failure, LoginResponse>> login(
  //   String email,
  //   String password,
  // ) async {
  //   var response = await crud.postData(ApiLink.login, {
  //     "email": email,
  //     "password": password,
  //   });
  //   return response.fold(
  //     (l) => Left(l),
  //     (r) => Right(LoginResponse.fromJson(r)),
  //   );
  // }
}
