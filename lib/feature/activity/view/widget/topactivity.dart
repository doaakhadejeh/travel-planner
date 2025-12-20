import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_planner/core/constant/imagesconst.dart';
import 'package:travel_planner/core/routing/const_rout.dart';

class Topactivity extends StatelessWidget {
  const Topactivity({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      width: 400.w,
      child: Stack(
        children: [
          Positioned(
            top: -57.h,
            right: 0.w,
            left: 0.w,
            child: Image.asset(
              Imagesconst.pic1,
              height: 300.h,
              width: 100.w,
              fit: .contain,
            ),
          ),
          Positioned(
            top: 70.h,
            left: 0.w,

            child: IconButton(
              onPressed: () {
                context.go(Routconst.trip);
              },
              icon: Icon(Icons.arrow_back, color: Colors.white),
            ),
          ),
          Positioned(
            top: 70.h,
            right: 4.w,
            left: 40.w,

            child: Text(
              "activities",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.sp,
                fontWeight: .bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
