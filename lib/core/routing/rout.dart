import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_planner/core/helper/sharedpref_helper.dart';
import 'package:travel_planner/core/routing/const_rout.dart';
import 'package:travel_planner/feature/auth/login/view/login.dart';
import 'package:travel_planner/feature/home/view/home.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: Routconst.home,
      builder: (BuildContext context, GoRouterState state) {
        return const MyHomePage();
      },
    ),
    GoRoute(
      path: Routconst.login,
      builder: (BuildContext context, GoRouterState state) {
        return const Login();
      },
    ),
  ],
  redirect: (context, state) {
    final isLoggedIn = SharedPrefHelper.getStringSync("userToken").isNotEmpty;

    final loggingIn = state.matchedLocation == Routconst.login;

    if (!isLoggedIn && !loggingIn) return Routconst.login;
    if (isLoggedIn && loggingIn) return Routconst.home;

    return null;
  },
);
