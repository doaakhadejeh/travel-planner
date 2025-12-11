import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_planner/core/routing/const_rout.dart';
import 'package:travel_planner/core/widget/custombutton.dart';

class Buttononboarding extends StatelessWidget {
  const Buttononboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 40.h,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Custombutton(
          onPressed: () {
            context.go(Routconst.login);
          },
          isRectangleBorder: true,
          radiusRectangleBorder: 10.sp,
          child: Text("Get Started"),
        ),
      ),
    );
  }
}
