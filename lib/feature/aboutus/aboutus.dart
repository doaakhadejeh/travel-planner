import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_planner/feature/aboutus/widget/builddescription.dart';
import 'package:travel_planner/feature/aboutus/widget/buildfeaturecard.dart';
import 'package:travel_planner/feature/aboutus/widget/buildsectiontitle.dart';
import 'package:travel_planner/feature/aboutus/widget/contactus.dart';
import 'package:travel_planner/feature/aboutus/widget/sliverappbarwidget.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBarWidget(),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildSectionTitle("Who We Are"),
                  SizedBox(height: 10.h),
                  buildDescription(
                    "We are a team of travel enthusiasts and AI experts dedicated to making trip planning seamless, personalized, and exciting for everyone.",
                  ),
                  SizedBox(height: 30.h),
                  buildSectionTitle("Our Mission"),
                  SizedBox(height: 10.h),
                  buildDescription(
                    "To empower travelers by using artificial intelligence to generate perfect itineraries based on individual preferences, budgets, and interests.",
                  ),
                  SizedBox(height: 30.h),
                  buildFeatureCard(
                    Icons.auto_awesome,
                    "AI Powered",
                    "Smart itineraries generated specifically for you.",
                  ),
                  buildFeatureCard(
                    Icons.favorite,
                    "Handpicked Styles",
                    "From luxury to budget, we cover all travel styles.",
                  ),
                  SizedBox(height: 20.h),
                  buildSectionTitle("Contact Us"),
                  SizedBox(height: 5.h),
                  ContactUs(),
                  SizedBox(height: 25.h),
                  Center(
                    child: Text(
                      "Version 1.0.0",
                      style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
