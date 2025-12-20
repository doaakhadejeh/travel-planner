import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_planner/feature/homescreen/view/widget/fieldhome.dart';

class ContentHome extends StatelessWidget {
  const ContentHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 250,
      right: 10,
      left: 10,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          padding: EdgeInsets.all(7),
          height: 250.h,
          width: 400.w,
          decoration: BoxDecoration(
            border: Border.all(width: 2.sp, color: Colors.black),
            borderRadius: BorderRadius.circular(15),
          ),
          child: FieldHome(),
        ),
      ),
    );
  }
}
