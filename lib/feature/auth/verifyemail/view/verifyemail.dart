import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_planner/feature/auth/verifyemail/view/widget/buttonresendverifycode.dart';
import 'package:travel_planner/feature/auth/verifyemail/view/widget/buttonverifyemail.dart';
import 'package:travel_planner/feature/auth/verifyemail/view/widget/fieldverifycode.dart';
import 'package:travel_planner/feature/auth/verifyemail/view/widget/verifylistener.dart';

class Verifyemail extends StatelessWidget {
  const Verifyemail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            SizedBox(height: 25.h),
            Text(
              " Verify your email",
              style: TextStyle(fontWeight: .bold, fontSize: 20.sp),
            ),
            SizedBox(height: 60.h),
            Fieldverifycode(),

            SizedBox(height: 50.h),
            Buttonverifyemail(),
            Buttonresendverifycode(),
            Verifylistener(),
          ],
        ),
      ),
    );
  }
}
