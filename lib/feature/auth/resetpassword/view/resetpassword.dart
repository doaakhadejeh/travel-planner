import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_planner/core/routing/const_rout.dart';
import 'package:travel_planner/core/widget/costomtextformfield.dart';
import 'package:travel_planner/core/widget/custombutton.dart';

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
            SizedBox(height: 25.h),
            Text(
              "  reset your password",
              style: TextStyle(
                // color: Colors.green,
                fontWeight: .bold,
                fontSize: 20.sp,
              ),
            ),
            SizedBox(height: 60.h),
            Text(
              "    Enter the verification code:",
              style: TextStyle(
                fontWeight: .bold,
                fontSize: 11.sp,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 10.h),
            OtpTextField(
              numberOfFields: 6,
              borderColor: Colors.green,
              showFieldAsBox: true,
              focusedBorderColor: Colors.green.shade200,
              enabledBorderColor: Colors.green,
              disabledBorderColor: Colors.green,
              onSubmit: (String verificationCode) {},
            ),
            SizedBox(height: 30.h),
            Text(
              "    Complete the fields:",
              style: TextStyle(
                fontWeight: .bold,
                fontSize: 11.sp,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 10.h),
            Costomtextformfield(hinttext: 'email', prefixicon: Icons.email),
            SizedBox(height: 3.h),
            Costomtextformfield(
              hinttext: 'new password',
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
            SizedBox(height: 50.h),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 14.w),
              child: Custombutton(
                onPressed: () {
                  context.go(Routconst.login);
                },
                backgroundColor: Colors.green.shade200,
                isRectangleBorder: true,
                radiusRectangleBorder: 10.sp,
                child: Text("reset    "),
              ),
            ),
            Center(
              child: InkWell(
                onTap: () => context.go(Routconst.forgetpassword),
                child: Text(
                  "resend verification code!",
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
