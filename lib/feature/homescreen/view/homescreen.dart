import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_planner/core/constant/imagesconst.dart';
import 'package:travel_planner/feature/homescreen/view/widget/buttongeneratetrip.dart';
import 'package:travel_planner/feature/homescreen/view/widget/buttongotomytrip.dart';
import 'package:travel_planner/feature/homescreen/view/widget/contenthome.dart';
import 'package:travel_planner/feature/homescreen/view/widget/homescreenlistener.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          height: 700.h,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Imagesconst.home1),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            color: Colors.black.withAlpha((0.4 * 255).round()),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  SizedBox(height: 70.h),
                  ContentHome(),
                  SizedBox(height: 100.h),
                  ButtonGenerateTrip(),
                  SizedBox(height: 5.h),
                  ButtonGoToMyTrip(),
                  Homescreenlistener(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
