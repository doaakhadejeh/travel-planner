import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopListViewTrip extends StatelessWidget {
  const TopListViewTrip({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.location_on, color: Colors.green.shade900),
        Text(
          "Trip:",
          textAlign: .start,
          style: TextStyle(
            color: Colors.green.shade900,
            fontSize: 15.sp,
            fontWeight: .bold,
          ),
        ),
      ],
    );
  }
}
