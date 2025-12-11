import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_planner/core/routing/const_rout.dart';
import 'package:travel_planner/core/widget/custombutton.dart';

class Buttongotologin extends StatelessWidget {
  const Buttongotologin({super.key});

  @override
  Widget build(BuildContext context) {
    return Custombutton(
      onPressed: () {
        context.go(Routconst.login);
      },
      backgroundColor: Colors.white,
      foregroundColor: Colors.green,
      isRectangleBorder: true,
      radiusRectangleBorder: 10.sp,
      child: Text("Login "),
    );
  }
}
