import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_planner/core/helper/dialoghelper.dart';
import 'package:travel_planner/core/routing/const_rout.dart';
import 'package:travel_planner/feature/itineraryday/logic/cubit/itineraryday_cubit.dart';
import 'package:travel_planner/feature/itineraryday/logic/cubit/itineraryday_state.dart';
import 'package:travel_planner/feature/itineraryday/view/widget/listviewitineraryday.dart';

class Itineraryday extends StatelessWidget {
  const Itineraryday({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.go(Routconst.trip);
          },
          icon: Icon(Icons.arrow_back),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Itinerary Days",
          style: TextStyle(
            color: Colors.green,
            fontSize: 30.sp,
            fontWeight: .bold,
          ),
        ),
      ),
      body: BlocListener<ItineraryDayCubit, ItineraryDayState>(
        listener: (context, state) {
          if (state is ItineraryDayError) {
            myDialog(
              context,
              title: state.error.message,
              content: const Icon(Icons.error, color: Colors.red),
            );
          }
        },
        child: BlocBuilder<ItineraryDayCubit, ItineraryDayState>(
          builder: (context, state) {
            if (state is ItineraryDayLoading) {
              return Center(
                child: CircularProgressIndicator(color: Colors.green),
              );
            }
            if (state is ItineraryDaySuccess) {
              final itineraryDays = state.response;
              return ListviewItineraryDay(itineraryDays: itineraryDays);
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
