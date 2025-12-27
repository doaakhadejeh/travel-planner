import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:travel_planner/core/network/api_crud.dart';
import 'package:travel_planner/core/network/api_error_model.dart';
import 'package:travel_planner/core/network/api_link.dart';
import 'package:travel_planner/feature/profile/data/model/profilemodel.dart';

class Profiledata {
  final Crud crud;
  Profiledata(this.crud);

  Future<Either<Failure, ProfileResponse>> getprofile() async {
    var response = await crud.getData(ApiLink.getprofile);
    return response.fold(
      (l) => Left(l),
      (r) => Right(ProfileResponse.fromJson(r)),
    );
  }

  Future<Either<Failure, ProfileResponse>> updateProfile(
    Map<dynamic, dynamic> data,
  ) async {
    var response = await crud.putData(ApiLink.updateProfile, data);
    return response.fold(
      (l) => Left(l),
      (r) => Right(ProfileResponse.fromJson(r)),
    );
  }

  Future<Either<Failure, Unit>> changePassword(
    String oldpassword,
    String newpassword,
    String passwordConfermation,
  ) async {
    var response = await crud.putData(ApiLink.changePassword, {
      'old_password': oldpassword,
      'new_password': newpassword,
      'new_password_confirmation': passwordConfermation,
    });
    return response.fold((l) => Left(l), (r) => Right(unit));
  }

  Future<Either<Failure, ProfileResponse>> profileImage(File image) async {
    FormData formData = FormData.fromMap({
      'image': await MultipartFile.fromFile(
        image.path,
        filename: image.path.split('/').last,
      ),
    });

    var response = await crud.postData(ApiLink.updateProfileImage, formData);

    return response.fold(
      (l) => Left(l),
      (r) => Right(ProfileResponse.fromJson(r)),
    );
  }
}
