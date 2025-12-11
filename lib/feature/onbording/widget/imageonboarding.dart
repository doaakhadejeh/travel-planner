import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_planner/core/constant/imagesconst.dart';

class Imageonboarding extends StatelessWidget {
  const Imageonboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -310.h,
      left: 0,
      right: 0,
      child: SizedBox(
        height: 900.h,
        width: double.infinity,
        child: Image.asset(Imagesconst.greenTour3, fit: BoxFit.contain),
      ),
    );
  }
}
