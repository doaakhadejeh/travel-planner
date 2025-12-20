import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_planner/core/di/dependcy_injection.dart';
import 'package:travel_planner/core/helper/sharedpref_helper.dart';
import 'package:travel_planner/core/routing/const_rout.dart';
import 'package:travel_planner/feature/activity/logic/cubit/activity_cubit.dart';
import 'package:travel_planner/feature/activity/view/activity.dart';
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
import 'package:travel_planner/feature/itineraryday/logic/cubit/itineraryday_cubit.dart';
import 'package:travel_planner/feature/itineraryday/view/itineraryday.dart';
import 'package:travel_planner/feature/onbording/onbording.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_planner/feature/trip/data/model/tripmodel.dart';
import 'package:travel_planner/feature/trip/logic/cubit/trip_cubit.dart';
import 'package:travel_planner/feature/trip/view/trip.dart';

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
    GoRoute(
      path: Routconst.itineraryDay,
      builder: (BuildContext context, GoRouterState state) {
        final trip = state.extra as TripResponse;
        return BlocProvider(
          create: (context) {
            final cubit = getIt<ItineraryDayCubit>();
            cubit.setTrip(trip);
            cubit.getTripDay();
            return cubit;
          },
          child: const Itineraryday(),
        );
      },
    ),
    GoRoute(
      path: Routconst.trip,
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider(
          create: (context) => getIt<TripCubit>()..getUserTrip(),
          child: const Trip(),
        );
      },
    ),
    GoRoute(
      path: '${Routconst.activities}/:dayId',
      builder: (BuildContext context, GoRouterState state) {
        final dayId = int.parse(state.pathParameters['dayId']!);
        return BlocProvider(
          create: (context) => getIt<ActivityCubit>()..getActivity(dayId),
          child: const Activity(),
        );
      },
    ),
  ],

  redirect: (context, state) async {
    final String token = await SharedPrefHelper.getSecuredString("userToken");
    final bool loggedIn = token.isNotEmpty;

    final authRoutes = [
      Routconst.login,
      Routconst.register,
      Routconst.forgetpassword,
      Routconst.resetpassword,
      Routconst.verifyemail,
    ];

    final bool isAuthRoute = authRoutes.contains(state.matchedLocation);

    if (!loggedIn && isAuthRoute) {
      return null;
    }

    if (!loggedIn && !isAuthRoute) {
      return Routconst.master;
    }

    if (loggedIn && state.matchedLocation == Routconst.master) {
      return Routconst.home;
    }

    return null;
  },
);
