import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_planner/core/routing/const_rout.dart';
import 'package:travel_planner/core/widget/custombutton.dart';

class FooterWidgetSuccess extends StatelessWidget {
  const FooterWidgetSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Custombutton(
          onPressed: () => context.push(Routconst.updateProfile),
          isRectangleBorder: true,
          radiusRectangleBorder: 10,
          child: Text("Update Profile"),
        ),
        SizedBox(height: 7.h),
        Custombutton(
          onPressed: () => context.push(Routconst.updatePassword),
          isRectangleBorder: true,
          radiusRectangleBorder: 10,
          child: Text("Update Password"),
        ),
      ],
    );
  }
}
