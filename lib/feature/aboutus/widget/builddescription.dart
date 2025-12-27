import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildDescription(String text) {
  return Text(
    text,
    style: TextStyle(fontSize: 15.sp, color: Colors.grey.shade700, height: 1.5),
  );
}
