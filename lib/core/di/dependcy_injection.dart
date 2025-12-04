import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:travel_planner/core/network/api_crud.dart';
import 'package:travel_planner/core/network/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & crud
  getIt.registerLazySingleton<Dio>(() => DioFactory.getDio());
  getIt.registerLazySingleton<Crud>(() => Crud(getIt<Dio>()));
}
