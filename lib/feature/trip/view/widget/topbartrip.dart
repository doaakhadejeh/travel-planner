import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_planner/core/routing/const_rout.dart';

class TopBarTrip extends StatelessWidget {
  const TopBarTrip({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 30.h,
      right: 80.w,
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              context.go(Routconst.home);
            },
            icon: Icon(Icons.arrow_back),
          ),
          SizedBox(width: 50.w),
          Text(
            "My Archive Trip",
            style: TextStyle(fontSize: 30.sp, fontWeight: .bold),
          ),
        ],
      ),
    );
  }
}
