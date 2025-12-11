import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Topresetpassword extends StatelessWidget {
  const Topresetpassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 25.h),
        Text(
          "  reset your password",
          style: TextStyle(fontWeight: .bold, fontSize: 20.sp),
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
      ],
    );
  }
}
