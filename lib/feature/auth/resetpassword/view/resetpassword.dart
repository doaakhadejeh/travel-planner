import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_planner/feature/auth/resetpassword/view/widget/buttonresetpassword.dart';
import 'package:travel_planner/feature/auth/resetpassword/view/widget/fieldresetpassword.dart';
import 'package:travel_planner/feature/auth/resetpassword/view/widget/resendverifycode.dart';
import 'package:travel_planner/feature/auth/resetpassword/view/widget/resetpasswordlistener.dart';
import 'package:travel_planner/feature/auth/resetpassword/view/widget/topresetpassword.dart';

class Resetpassword extends StatelessWidget {
  const Resetpassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            Topresetpassword(),
            SizedBox(height: 10.h),
            Fieldresetpassword(),
            SizedBox(height: 50.h),
            Buttonresetpassword(),
            Resendverifycode(),
            Resetpasswordlistener(),
          ],
        ),
      ),
    );
  }
}
