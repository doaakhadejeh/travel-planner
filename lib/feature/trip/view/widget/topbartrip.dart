import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopBarTrip extends StatelessWidget {
  const TopBarTrip({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Trip History",
      style: TextStyle(fontSize: 30.sp, fontWeight: .bold),
    );
  }
}
