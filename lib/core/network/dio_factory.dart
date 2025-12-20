import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:travel_planner/core/helper/sharedpref_helper.dart';

class DioFactory {
  DioFactory._();

  static Dio? _dio;
  static bool _interceptorsAdded = false;

  static Dio getDio() {
    if (_dio != null) return _dio!;

    _dio = Dio();

    _dio!.options
      ..connectTimeout = const Duration(seconds: 360)
      ..receiveTimeout = const Duration(seconds: 360);

    _addInterceptorsOnce();

    return _dio!;
  }

  static void _addInterceptorsOnce() {
    if (_interceptorsAdded) return;
    _interceptorsAdded = true;

    _dio!.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await SharedPrefHelper.getSecuredString("userToken");

          options.headers['Accept'] = 'application/json';

          if (token.isNotEmpty) {
            options.headers['Authorization'] = "Bearer $token";
          }

          return handler.next(options);
        },
      ),
    );

    _dio!.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ),
    );
  }
}
