import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_planner/core/routing/const_rout.dart';
import 'package:travel_planner/core/widget/custombutton.dart';

class Buttongotoregister extends StatelessWidget {
  const Buttongotoregister({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 10.w),
      child: Custombutton(
        onPressed: () {
          context.go(Routconst.register);
        },
        isRectangleBorder: true,
        radiusRectangleBorder: 10.sp,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        child: Text("Register "),
      ),
    );
  }
}
