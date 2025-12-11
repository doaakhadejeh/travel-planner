import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:travel_planner/core/network/api_crud.dart';
import 'package:travel_planner/core/network/dio_factory.dart';
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
}
