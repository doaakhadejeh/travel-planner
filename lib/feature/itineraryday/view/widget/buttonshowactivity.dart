import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_planner/core/routing/const_rout.dart';
import 'package:travel_planner/feature/itineraryday/data/model/itineraraydaymodel.dart';

class ButtonShowActivity extends StatelessWidget {
  final ItineraryDayResponse itineraryDay;
  const ButtonShowActivity({super.key, required this.itineraryDay});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: .bottomRight,
      child: InkWell(
        onTap: () {
          context.go("${Routconst.activities}/${itineraryDay.id}");
        },
        child: Text(
          "show activities",
          style: TextStyle(
            fontSize: 10.sp,
            fontWeight: .bold,
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}
