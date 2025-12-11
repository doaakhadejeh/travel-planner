import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_planner/core/constant/imagesconst.dart';

class Toplogin extends StatelessWidget {
  const Toplogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(Imagesconst.logo, height: 200.h, width: 200.w),
        SizedBox(height: 5.h),
        Text(
          "WellCome Back",
          style: TextStyle(fontSize: 27.sp, fontWeight: .bold),
        ),
        SizedBox(height: 15.h),
        Text(
          "login with your account",
          style: TextStyle(fontSize: 15.sp, color: Colors.grey),
        ),
      ],
    );
  }
}
