import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:travel_planner/core/network/api_crud.dart';
import 'package:travel_planner/core/network/dio_factory.dart';
import 'package:travel_planner/feature/activity/data/remote/activityremote.dart';
import 'package:travel_planner/feature/activity/logic/cubit/activity_cubit.dart';
import 'package:travel_planner/feature/auth/forgetpassword/data/remote/forgetpassremote.dart';
import 'package:travel_planner/feature/auth/forgetpassword/logic/cubit/forgetpassword_cubit.dart';
import 'package:travel_planner/feature/auth/login/data/remote/loginremot.dart';
import 'package:travel_planner/feature/auth/login/logic/cubit/login_cubit.dart';
import 'package:travel_planner/feature/auth/register/data/remote/registerremote.dart';
import 'package:travel_planner/feature/auth/register/logic/cubit/register_cubit.dart';
import 'package:travel_planner/feature/auth/resetpassword/data/remote/resetpassremote.dart';
import 'package:travel_planner/feature/auth/resetpassword/logic/cubit/resetpassword_cubit.dart';
import 'package:travel_planner/feature/auth/verifyemail/data/remote/verifyemailremote.dart';
import 'package:travel_planner/feature/auth/verifyemail/logic/cubit/verifyemail_cubit.dart';
import 'package:travel_planner/feature/favourite/data/remote/favouriteremote.dart';
import 'package:travel_planner/feature/favourite/logic/cubit/favourite_cubit.dart';
import 'package:travel_planner/feature/homescreen/data/remote/homescreenremote.dart';
import 'package:travel_planner/feature/homescreen/logic/cubit/homescreen_cubit.dart';
import 'package:travel_planner/feature/itineraryday/data/remote/itinerarydayremote.dart';
import 'package:travel_planner/feature/itineraryday/logic/cubit/itineraryday_cubit.dart';
import 'package:travel_planner/feature/setting/data/remote/settingremote.dart';
import 'package:travel_planner/feature/setting/logic/cubit/setting_cubit.dart';
import 'package:travel_planner/feature/trip/data/remote/tripmodel.dart';
import 'package:travel_planner/feature/trip/logic/cubit/trip_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & crud
  getIt.registerLazySingleton<Dio>(() => DioFactory.getDio());
  getIt.registerLazySingleton<Crud>(() => Crud(getIt<Dio>()));

  // login
  getIt.registerLazySingleton<Logindata>(() => Logindata(getIt<Crud>()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  // register
  getIt.registerLazySingleton<Registerdata>(() => Registerdata(getIt<Crud>()));
  getIt.registerFactory<RegisterCubit>(() => RegisterCubit(getIt()));

  //forgetpassword
  getIt.registerLazySingleton<Forgetpassdata>(
    () => Forgetpassdata(getIt<Crud>()),
  );
  getIt.registerFactory<ForgetpasswordCubit>(
    () => ForgetpasswordCubit(getIt()),
  );

  //resetpassword
  getIt.registerLazySingleton<Resetpassdata>(
    () => Resetpassdata(getIt<Crud>()),
  );
  getIt.registerFactory<ResetpasswordCubit>(() => ResetpasswordCubit(getIt()));

  //verifyemail
  getIt.registerLazySingleton<Verifyemaildata>(
    () => Verifyemaildata(getIt<Crud>()),
  );
  getIt.registerFactory<VerifyemailCubit>(() => VerifyemailCubit(getIt()));

  // home screen
  getIt.registerLazySingleton<Homescreendata>(
    () => Homescreendata(getIt<Crud>()),
  );
  getIt.registerFactory<HomescreenCubit>(() => HomescreenCubit(getIt()));

  // favourite
  getIt.registerLazySingleton<Favouritedata>(
    () => Favouritedata(getIt<Crud>()),
  );
  getIt.registerFactory<FavouriteCubit>(() => FavouriteCubit(getIt()));

  // setting
  getIt.registerLazySingleton<Settingdata>(() => Settingdata(getIt<Crud>()));
  getIt.registerFactory<SettingCubit>(() => SettingCubit(getIt()));

  // itinerary day
  getIt.registerLazySingleton<Itinerarydaydata>(
    () => Itinerarydaydata(getIt<Crud>()),
  );
  getIt.registerFactory<ItineraryDayCubit>(() => ItineraryDayCubit(getIt()));

  // trip
  getIt.registerLazySingleton<Tripdata>(() => Tripdata(getIt<Crud>()));
  getIt.registerFactory<TripCubit>(() => TripCubit(getIt()));

  // activities
  getIt.registerLazySingleton<Activitydata>(() => Activitydata(getIt<Crud>()));
  getIt.registerFactory<ActivityCubit>(() => ActivityCubit(getIt()));
}
