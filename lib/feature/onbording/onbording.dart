import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_planner/feature/onbording/widget/buttononboarding.dart';
import 'package:travel_planner/feature/onbording/widget/containeronboarding.dart';
import 'package:travel_planner/feature/onbording/widget/imageonboarding.dart';

class Onbording extends StatelessWidget {
  const Onbording({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(bottom: 5.h),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                alignment: AlignmentGeometry.topCenter,
                children: [
                  Container(height: 100.h, color: Colors.green.shade300),
                  Imageonboarding(),
                  Containeronboarding(),
                  Buttononboarding(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
