import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_planner/core/helper/dialoghelper.dart';
import 'package:travel_planner/feature/activity/logic/cubit/activity_cubit.dart';
import 'package:travel_planner/feature/activity/logic/cubit/activity_state.dart';

class Activitylistener extends StatelessWidget {
  const Activitylistener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ActivityCubit, ActivityState>(
      listener: (context, state) {
        if (state is ActivityError) {
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
