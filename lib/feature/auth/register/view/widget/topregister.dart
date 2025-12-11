import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_planner/core/constant/imagesconst.dart';

class Topregister extends StatelessWidget {
  const Topregister({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(Imagesconst.logo, height: 190.h, width: 190.w),
        SizedBox(height: 5.h),
        Text(
          "WellCome",
          style: TextStyle(fontSize: 29.sp, fontWeight: .bold),
        ),
        SizedBox(height: 10.h),
        Text(
          "Register with new account",
          style: TextStyle(fontSize: 15.sp, color: Colors.grey),
        ),
      ],
    );
  }
}
