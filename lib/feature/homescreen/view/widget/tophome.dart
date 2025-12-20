import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_planner/core/constant/imagesconst.dart';

class TopHome extends StatelessWidget {
  const TopHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Imagesconst.home1,
      height: 620.h,
      width: 1000.w,
      fit: .cover,
    );
  }
}
