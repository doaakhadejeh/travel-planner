import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_planner/core/helper/dialoghelper.dart';
import 'package:travel_planner/core/routing/const_rout.dart';
import 'package:travel_planner/feature/homescreen/logic/cubit/homescreen_cubit.dart';
import 'package:travel_planner/feature/homescreen/logic/cubit/homescreen_state.dart';

class Homescreenlistener extends StatelessWidget {
  const Homescreenlistener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomescreenCubit, HomescreenState>(
      listener: (context, state) {
        if (state is HomescreenSuccess) {
          myDialog(
            context,
            title: "generate your trip done ",
            content: const Icon(Icons.check_circle, color: Colors.green),
          );
          context.go(Routconst.itineraryDay);
        } else if (state is HomescreenError) {
          myDialog(
            context,
            title: state.error.message,
            content: const Icon(Icons.error, color: Colors.red),
          );
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
