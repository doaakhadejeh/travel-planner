import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_planner/core/constant/imagesconst.dart';
import 'package:travel_planner/core/routing/const_rout.dart';
import 'package:travel_planner/core/widget/costomtextformfield.dart';
import 'package:travel_planner/core/widget/custombutton.dart';

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
            SizedBox(height: 10.h),
            Costomtextformfield(hinttext: 'email', prefixicon: Icons.email),
            SizedBox(height: 5.h),
            Costomtextformfield(
              hinttext: 'password',
              prefixicon: Icons.lock,
              obscureText: true,
              showtext: () {},
            ),
            SizedBox(height: 50.h),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 10.w),
              child: Custombutton(
                onPressed: () {},
                isRectangleBorder: true,
                radiusRectangleBorder: 10.sp,
                child: Text("Login"),
              ),
            ),
            Padding(
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
            ),
            SizedBox(height: 10.h),
            Center(
              child: InkWell(
                onTap: () => context.go(Routconst.forgetpassword),
                child: Text(
                  "forget my password!",
                  style: TextStyle(
                    fontWeight: .bold,
                    color: Colors.green.shade400,
                    fontSize: 9.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
