// import 'package:dio/dio.dart';
// import 'package:pretty_dio_logger/pretty_dio_logger.dart';
// import 'package:travel_planner/core/helper/sharedpref_helper.dart';

// class DioFactory {
//   /// private constructor as I don't want to allow creating an instance of this class
//   DioFactory._();

//   static Dio? dio;

//   static Dio getDio() {
//     Duration timeOut = const Duration(seconds: 30);

//     if (dio == null) {
//       dio = Dio();
//       dio!
//         ..options.connectTimeout = timeOut
//         ..options.receiveTimeout = timeOut;
//       addDioHeaders();
//       addDioInterceptor();
//       return dio!;
//     } else {
//       return dio!;
//     }
//   }

//   static void addDioHeaders() async {
//     dio?.options.headers = {
//       'Accept': 'application/json',
//       'Authorization':
//           'Bearer ${await SharedPrefHelper.getSecuredString("userToken")}',
//     };
//   }

//   static void setTokenIntoHeaderAfterLogin(String token) {
//     dio?.options.headers = {'Authorization': 'Bearer $token'};
//   }

//   static void addDioInterceptor() {
//     dio?.interceptors.add(
//       PrettyDioLogger(
//         requestBody: true,
//         requestHeader: true,
//         responseHeader: true,
//       ),
//     );
//   }
// }

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:travel_planner/core/helper/sharedpref_helper.dart';

class DioFactory {
  DioFactory._(); // private constructor

  static Dio? _dio;
  static bool _interceptorsAdded = false;

  static Dio getDio() {
    if (_dio != null) return _dio!;

    _dio = Dio();

    _dio!.options
      ..connectTimeout = const Duration(seconds: 30)
      ..receiveTimeout = const Duration(seconds: 30);

    _addInterceptorsOnce();

    return _dio!;
  }

  static void _addInterceptorsOnce() {
    if (_interceptorsAdded) return; // الحل السحري
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
