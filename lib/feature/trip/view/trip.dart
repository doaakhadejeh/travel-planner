import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_planner/feature/trip/logic/cubit/trip_cubit.dart';
import 'package:travel_planner/feature/trip/logic/cubit/trip_state.dart';
import 'package:travel_planner/feature/trip/view/widget/listenertrip.dart';
import 'package:travel_planner/feature/trip/view/widget/topbartrip.dart';
import 'package:travel_planner/feature/trip/view/widget/toptrip.dart';
import 'package:travel_planner/feature/trip/view/widget/widgetloadingtrip.dart';
import 'package:travel_planner/feature/trip/view/widget/widgetsuccesstrip.dart';

class Trip extends StatelessWidget {
  const Trip({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          Stack(
            children: [
              TopTrip(),
              TopBarTrip(),
              BlocBuilder<TripCubit, TripState>(
                builder: (context, state) {
                  if (state is TripLoading) {
                    return WidgetLoadingTrip();
                  }
                  if (state is TripSuccess) {
                    final trips = state.response;

                    return Widgetsuccesstrip(trips: trips);
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
          ListenerTrip(),
        ],
      ),
    );
  }
}
