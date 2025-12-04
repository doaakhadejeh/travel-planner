import 'package:dio/dio.dart';
import 'package:travel_planner/core/network/api_error_model.dart';

Failure handleDioError(dynamic e) {
  if (e is DioException) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return Failure("Connection timeout");
      case DioExceptionType.receiveTimeout:
        return Failure("Receive timeout");
      case DioExceptionType.sendTimeout:
        return Failure("Send timeout");
      case DioExceptionType.badCertificate:
      case DioExceptionType.badResponse:
        return Failure(
          e.response?.data["message"] ?? "Server error",
          statusCode: e.response?.statusCode,
        );
      case DioExceptionType.cancel:
        return Failure("Request cancelled");
      case DioExceptionType.unknown:
        return Failure("No Internet connection");
      default:
        return Failure("Unexpected error happened");
    }
  }

  return Failure("Unknown error");
}
