import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:travel_planner/core/network/api_error_model.dart';
import 'package:travel_planner/core/network/api_error_state.dart';

class Crud {
  final Dio _dio;
  Crud(this._dio);

  Future<Either<Failure, Map>> postData(String linkUrl, dynamic data) async {
    try {
      var response = await _dio.post(linkUrl, data: data);

      return Right(response.data);
    } catch (e) {
      return left(handleDioError(e));
    }
  }

  Future<Either<Failure, Map>> getdata(String linkurl) async {
    try {
      var response = await _dio.get(linkurl);
      return Right(response.data);
    } catch (e) {
      return left(handleDioError(e));
    }
  }

  Future<Either<Failure, Map>> putdata(String linkurl, dynamic data) async {
    try {
      var response = await _dio.put(linkurl, data: data);
      return Right(response.data);
    } catch (e) {
      return left(handleDioError(e));
    }
  }

  Future<Either<Failure, Map>> deletedata(String linkurl) async {
    try {
      var response = await _dio.delete(linkurl);
      return Right(response.data);
    } catch (e) {
      return left(handleDioError(e));
    }
  }
}
