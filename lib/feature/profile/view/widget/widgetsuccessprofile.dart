import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_planner/feature/profile/data/model/profilemodel.dart';
import 'package:travel_planner/feature/profile/view/widget/footerwidgetsuccess.dart';
import 'package:travel_planner/feature/profile/view/widget/topwidgetsuccess.dart';

class WidgetsuccessProfile extends StatelessWidget {
  final ProfileResponse profile;
  const WidgetsuccessProfile({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ListView(
        children: [
          TopWidgetSuccess(profile: profile),
          SizedBox(height: 40.w),
          Row(
            children: [
              Icon(Icons.person),
              SizedBox(width: 4.w),
              Text(profile.name, style: TextStyle(fontSize: 15.sp)),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              Icon(Icons.email),
              SizedBox(width: 4.w),
              Text(profile.email, style: TextStyle(fontSize: 15.sp)),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              Icon(Icons.phone_android),
              SizedBox(width: 4.w),
              Text(profile.phoneNumber, style: TextStyle(fontSize: 15.sp)),
            ],
          ),
          SizedBox(height: 50.h),
          FooterWidgetSuccess(),
        ],
      ),
    );
  }
}
