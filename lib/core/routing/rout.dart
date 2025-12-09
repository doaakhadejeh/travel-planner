import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_planner/core/routing/const_rout.dart';
import 'package:travel_planner/feature/auth/forgetpassword/view/forgetpassword.dart';
import 'package:travel_planner/feature/auth/login/view/login.dart';
import 'package:travel_planner/feature/auth/register/view/register.dart';
import 'package:travel_planner/feature/auth/resetpassword/view/resetpassword.dart';
import 'package:travel_planner/feature/auth/verifyemail/view/verifyemail.dart';
import 'package:travel_planner/feature/home/view/home.dart';
import 'package:travel_planner/onbording.dart';

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
        return const Login();
      },
    ),
    GoRoute(
      path: Routconst.register,
      builder: (BuildContext context, GoRouterState state) {
        return const Register();
      },
    ),
    GoRoute(
      path: Routconst.forgetpassword,
      builder: (BuildContext context, GoRouterState state) {
        return const Forgetpassword();
      },
    ),
    GoRoute(
      path: Routconst.resetpassword,
      builder: (BuildContext context, GoRouterState state) {
        return const Resetpassword();
      },
    ),
    GoRoute(
      path: Routconst.verifyemail,
      builder: (BuildContext context, GoRouterState state) {
        return const Verifyemail();
      },
    ),
  ],
  // redirect: (context, state) {
  //   final isLoggedIn = SharedPrefHelper.getStringSync("userToken").isNotEmpty;

  //   final loggingIn = state.matchedLocation == Routconst.login;

  //   if (!isLoggedIn && !loggingIn) return Routconst.login;
  //   if (isLoggedIn && loggingIn) return Routconst.home;

  //   return null;
  // },
);
