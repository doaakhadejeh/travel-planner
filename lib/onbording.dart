import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_planner/core/constant/imagesconst.dart';
import 'package:travel_planner/core/routing/const_rout.dart';
import 'package:travel_planner/core/widget/custombutton.dart';

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
                  Positioned(
                    top: -310.h,
                    left: 0,
                    right: 0,
                    child: SizedBox(
                      height: 900.h,
                      width: double.infinity,
                      child: Image.asset(
                        Imagesconst.greenTour3,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 170.h,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 280.h,
                      width: 400.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(25),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 25.sp),
                            Text(
                              "AI Travel Planner",
                              style: TextStyle(
                                fontSize: 28.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                            SizedBox(height: 46.h),
                            Center(
                              child: Text(
                                "Welcome to our app – Your Smart Travel Companion! \n Let our AI handle the details so you can focus on the adventure. \n Tell us your preferences and our AI will build a custom itinerary, recommending the best places to see, eat, and experience.",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(height: 100.h),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 40.h,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(40),
                      child: Custombutton(
                        onPressed: () {
                          context.go(Routconst.login);
                        },
                        isRectangleBorder: true,
                        radiusRectangleBorder: 10.sp,
                        child: Text("Get Started"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
