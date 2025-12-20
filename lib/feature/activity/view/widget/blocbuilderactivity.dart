import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:travel_planner/feature/activity/logic/cubit/activity_cubit.dart';
import 'package:travel_planner/feature/activity/logic/cubit/activity_state.dart';
import 'package:travel_planner/feature/activity/view/widget/listviewactivity.dart';

class Blocbuilderactivity extends StatelessWidget {
  const Blocbuilderactivity({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActivityCubit, ActivityState>(
      builder: (context, state) {
        if (state is ActivityLoading) {
          return Center(child: CircularProgressIndicator(color: Colors.green));
        }
        if (state is ActivitySuccess) {
          final activities = state.response;
          return Expanded(child: Listviewactivity(activities: activities));
        }
        return const SizedBox.shrink();
      },
    );
  }
}
