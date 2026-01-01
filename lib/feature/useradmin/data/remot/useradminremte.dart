import 'package:dartz/dartz.dart';
import 'package:travel_planner/core/model/usermodel.dart';
import 'package:travel_planner/core/network/api_crud.dart';
import 'package:travel_planner/core/network/api_error_model.dart';
import 'package:travel_planner/core/network/api_link.dart';

class UserAdmindata {
  final Crud crud;
  UserAdmindata(this.crud);

  Future<Either<Failure, List<UserResponse>>> getUserAdmin() async {
    var response = await crud.getData(ApiLink.getalluser);
    return response.fold((l) => Left(l), (r) {
      final List<dynamic> data = r['data'];
      final users = data.map((e) => UserResponse.fromJson(e)).toList();
      return Right(users);
    });
  }

  Future<Either<Failure, UserResponse>> toggleBlockUser(int userId) async {
    var response = await crud.putData(ApiLink.toggleBlockUser(userId), {});
    return response.fold(
      (l) => Left(l),
      (r) => Right(UserResponse.fromJson(r['data'])),
    );
  }
}
