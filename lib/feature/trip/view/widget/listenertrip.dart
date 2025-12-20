import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_planner/core/helper/dialoghelper.dart';
import 'package:travel_planner/feature/trip/logic/cubit/trip_cubit.dart';
import 'package:travel_planner/feature/trip/logic/cubit/trip_state.dart';

class ListenerTrip extends StatelessWidget {
  const ListenerTrip({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<TripCubit, TripState>(
      listener: (context, state) {
        if (state is TripError) {
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
