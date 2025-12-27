import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildFeatureCard(IconData icon, String title, String desc) {
  return Container(
    margin: EdgeInsets.only(bottom: 15.h),
    padding: EdgeInsets.all(15.w),
    decoration: BoxDecoration(
      color: Colors.green.shade50,
      borderRadius: BorderRadius.circular(15),
    ),
    child: Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.green.shade900,
          child: Icon(icon, color: Colors.white, size: 20.sp),
        ),
        SizedBox(width: 15.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
              ),
              Text(
                desc,
                style: TextStyle(color: Colors.grey.shade600, fontSize: 13.sp),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
