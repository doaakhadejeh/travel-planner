import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> myDialog(
  BuildContext context, {
  required String title,
  required Widget content,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Row(
          children: [
            Expanded(
              child: Text(
                title,
                overflow: .clip,
                maxLines: 1,
                style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        content: content,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.green),
          borderRadius: BorderRadius.circular(12),
        ),

        backgroundColor: Colors.white,

        contentTextStyle: TextStyle(
          fontSize: 10.sp,
          color: Colors.grey,
          fontWeight: FontWeight.w300,
        ),
      );
    },
  );
}
