import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_planner/core/routing/const_rout.dart';
import 'package:travel_planner/core/widget/costomtextformfield.dart';
import 'package:travel_planner/core/widget/custombutton.dart';

class Forgetpassword extends StatelessWidget {
  const Forgetpassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            SizedBox(height: 20.h),
            Text(
              "forget your password!",
              style: TextStyle(
                // color: Colors.green,
                fontWeight: .bold,
                fontSize: 20.sp,
              ),
            ),
            SizedBox(height: 60.h),
            Text(
              "    enter your email:",
              style: TextStyle(
                fontWeight: .bold,
                fontSize: 11.sp,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 10.h),
            Costomtextformfield(hinttext: 'email', prefixicon: Icons.email),
            SizedBox(height: 30.h),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 14.w),
              child: Custombutton(
                onPressed: () {
                  context.go(Routconst.resetpassword);
                },
                backgroundColor: Colors.green.shade200,
                isRectangleBorder: true,
                radiusRectangleBorder: 10.sp,
                child: Text("verify    "),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
