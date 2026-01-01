import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_planner/core/routing/const_rout.dart';
import 'package:travel_planner/core/widget/custombutton.dart';

class ButtonGoToMyTrip extends StatelessWidget {
  const ButtonGoToMyTrip({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Custombutton(
        backgroundColor: Colors.white,
        foregroundColor: Colors.green.shade800,
        borderColor: Colors.green.shade800,

        onPressed: () {
          context.push(Routconst.trip);
        },
        isRectangleBorder: true,
        radiusRectangleBorder: 10,
        child: Text("Go to My Trips"),
      ),
    );
  }
}
