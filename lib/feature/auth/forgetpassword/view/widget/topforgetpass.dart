import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Topforgetpassword extends StatelessWidget {
  const Topforgetpassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "forget your password!",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
        ),

        SizedBox(height: 60.h),

        Text(
          "enter your email:",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 11.sp,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
