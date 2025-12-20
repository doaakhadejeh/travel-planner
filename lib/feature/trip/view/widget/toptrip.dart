import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_planner/core/constant/imagesconst.dart';

class TopTrip extends StatelessWidget {
  const TopTrip({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Imagesconst.home5,
      height: 1000.h,
      width: 1000.w,
      fit: .cover,
    );
  }
}
