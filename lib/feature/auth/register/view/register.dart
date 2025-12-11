import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_planner/feature/auth/register/view/widget/buttongotologin.dart';
import 'package:travel_planner/feature/auth/register/view/widget/buttonregister.dart';
import 'package:travel_planner/feature/auth/register/view/widget/fieldregister.dart';
import 'package:travel_planner/feature/auth/register/view/widget/listenerregister.dart';
import 'package:travel_planner/feature/auth/register/view/widget/topregister.dart';

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
            Topregister(),
            SizedBox(height: 10.h),
            Fieldregister(),
            SizedBox(height: 10.h),
            Buttonregister(),
            SizedBox(height: 2.h),
            Buttongotologin(),
            Listenerregister(),
          ],
        ),
      ),
    );
  }
}
