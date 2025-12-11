import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_planner/core/di/dependcy_injection.dart';
import 'package:travel_planner/core/helper/sharedpref_helper.dart';
import 'package:travel_planner/core/routing/const_rout.dart';
import 'package:travel_planner/feature/auth/forgetpassword/logic/cubit/forgetpassword_cubit.dart';
import 'package:travel_planner/feature/auth/forgetpassword/view/forgetpassword.dart';
import 'package:travel_planner/feature/auth/login/logic/cubit/login_cubit.dart';
import 'package:travel_planner/feature/auth/login/view/login.dart';
import 'package:travel_planner/feature/auth/register/logic/cubit/register_cubit.dart';
import 'package:travel_planner/feature/auth/register/view/register.dart';
import 'package:travel_planner/feature/auth/resetpassword/logic/cubit/resetpassword_cubit.dart';
import 'package:travel_planner/feature/auth/resetpassword/view/resetpassword.dart';
import 'package:travel_planner/feature/auth/verifyemail/logic/cubit/verifyemail_cubit.dart';
import 'package:travel_planner/feature/auth/verifyemail/view/verifyemail.dart';
import 'package:travel_planner/feature/home/view/home.dart';
import 'package:travel_planner/feature/onbording/onbording.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: Routconst.home,
      builder: (BuildContext context, GoRouterState state) {
        return const MyHomePage();
      },
    ),
    GoRoute(
      path: Routconst.master,
      builder: (BuildContext context, GoRouterState state) {
        return const Onbording();
      },
    ),
    GoRoute(
      path: Routconst.login,
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider(
          create: (context) => getIt<LoginCubit>(),
          child: const Login(),
        );
      },
    ),
    GoRoute(
      path: Routconst.register,
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider(
          create: (context) => getIt<RegisterCubit>(),
          child: const Register(),
        );
      },
    ),
    GoRoute(
      path: Routconst.forgetpassword,
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider(
          create: (context) => getIt<ForgetpasswordCubit>(),
          child: const Forgetpassword(),
        );
      },
    ),
    GoRoute(
      path: Routconst.resetpassword,
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider(
          create: (context) => getIt<ResetpasswordCubit>(),
          child: const Resetpassword(),
        );
      },
    ),
    GoRoute(
      path: Routconst.verifyemail,
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider(
          create: (context) => getIt<VerifyemailCubit>(),
          child: const Verifyemail(),
        );
      },
    ),
  ],
  redirect: (context, state) {
    final token = SharedPrefHelper.getStringSync("userToken");

    final bool loggedIn = token.isNotEmpty;
    final bool onboarding = state.matchedLocation == Routconst.onbording;

    if (!loggedIn && !onboarding) {
      return Routconst.onbording;
    }

    if (loggedIn && onboarding) {
      return Routconst.home;
    }

    return null;
  },
);
