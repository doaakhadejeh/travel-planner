import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopSetting extends StatelessWidget {
  const TopSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      child: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Divider(height: 50.h, color: Colors.green.shade900),
            Text(
              "setting  ",
              style: TextStyle(
                fontWeight: .w600,
                fontSize: 30.sp,
                color: Colors.green.shade900,
              ),
            ),
            Divider(height: 50.h, color: Colors.green.shade900),
          ],
        ),
      ),
    );
  }
}
