import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_planner/feature/itineraryday/data/model/itineraraydaymodel.dart';
import 'package:travel_planner/feature/itineraryday/logic/cubit/itineraryday_cubit.dart';

class TopListviewDay extends StatelessWidget {
  final ItineraryDayResponse itineraryDay;

  const TopListviewDay({super.key, required this.itineraryDay});

  @override
  Widget build(BuildContext context) {
    final isToday = context.read<ItineraryDayCubit>().isToday(
      itineraryDay.dayNumber,
    );
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Text(
          "Day ${itineraryDay.dayNumber}",
          style: TextStyle(fontSize: 15.sp, fontWeight: .bold),
        ),
        if (isToday)
          Align(
            alignment: .topRight,
            child: Icon(
              Icons.location_on,
              size: 40.sp,
              color: Colors.green.shade900,
            ),
          ),
      ],
    );
  }
}
