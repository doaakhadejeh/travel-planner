import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WidgetLoadingTrip extends StatelessWidget {
  const WidgetLoadingTrip({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Center(
        child: SizedBox(
          height: 100.h,
          width: 100.w,
          child: Center(
            child: const CircleAvatar(
              child: CircularProgressIndicator(color: Colors.green),
            ),
          ),
        ),
      ),
    );
  }
}
