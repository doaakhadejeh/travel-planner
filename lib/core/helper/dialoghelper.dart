import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future myDialog(
  dynamic context,
  String title,
  Widget content,
  Widget? icon,
  List<Widget>? action,
) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(
          title,
          style: TextStyle(fontSize: 20.sp, fontWeight: .bold),
        ),
        content: content,
        icon: icon,
        actions: action,
        backgroundColor: Colors.white,
        iconColor: Colors.green,
        contentTextStyle: TextStyle(
          fontSize: 10.sp,
          color: Colors.grey,
          fontWeight: .w300,
        ),
      );
    },
  );
}
