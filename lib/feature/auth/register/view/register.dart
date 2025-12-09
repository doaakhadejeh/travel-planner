import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_planner/core/constant/imagesconst.dart';
import 'package:travel_planner/core/routing/const_rout.dart';
import 'package:travel_planner/core/widget/costomtextformfield.dart';
import 'package:travel_planner/core/widget/custombutton.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(15.w),
        child: ListView(
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
            SizedBox(height: 10.h),
            Costomtextformfield(hinttext: 'name', prefixicon: Icons.person),
            SizedBox(height: 3.h),
            Costomtextformfield(hinttext: 'email', prefixicon: Icons.email),
            SizedBox(height: 3.h),
            Costomtextformfield(
              hinttext: 'password',
              prefixicon: Icons.lock,
              obscureText: true,
              showtext: () {},
            ),
            SizedBox(height: 3.h),

            Costomtextformfield(
              hinttext: 'confirm password',
              prefixicon: Icons.lock,
              obscureText: true,
              showtext: () {},
            ),
            SizedBox(height: 3.h),

            Costomtextformfield(
              hinttext: 'phone number',
              typekeybord: .number,
              prefixicon: Icons.phone,
            ),
            SizedBox(height: 10.h),
            Custombutton(
              onPressed: () {
                context.go(Routconst.verifyemail);
              },
              isRectangleBorder: true,
              radiusRectangleBorder: 10.sp,
              child: Text("register"),
            ),
            SizedBox(height: 2.h),
            Custombutton(
              onPressed: () {
                context.go(Routconst.login);
              },
              backgroundColor: Colors.white,
              foregroundColor: Colors.green,
              isRectangleBorder: true,
              radiusRectangleBorder: 10.sp,
              child: Text("Login "),
            ),
          ],
        ),
      ),
    );
  }
}
