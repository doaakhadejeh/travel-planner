import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildSectionTitle(String title) {
  return Text(
    title,
    style: TextStyle(
      fontSize: 22.sp,
      fontWeight: FontWeight.bold,
      color: Colors.green.shade900,
    ),
  );
}
