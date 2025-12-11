import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_planner/feature/auth/forgetpassword/view/widget/buttonforgetpass.dart';
import 'package:travel_planner/feature/auth/login/view/widget/buttongotoregister.dart';
import 'package:travel_planner/feature/auth/login/view/widget/buttonlogin.dart';
import 'package:travel_planner/feature/auth/login/view/widget/emilandpassword.dart';
import 'package:travel_planner/feature/auth/login/view/widget/loginlistener.dart';
import 'package:travel_planner/feature/auth/login/view/widget/toplogin.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(15.w),
        child: ListView(
          children: [
            Toplogin(),
            SizedBox(height: 10.h),
            Emilandpassword(),
            SizedBox(height: 50.h),
            Buttonlogin(),
            Buttongotoregister(),
            SizedBox(height: 10.h),
            Buttonforgetpassword(),
            Loginlistener(),
          ],
        ),
      ),
    );
  }
}
