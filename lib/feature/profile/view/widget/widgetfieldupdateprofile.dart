import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_planner/core/widget/costomtextformfield.dart';
import 'package:travel_planner/core/widget/custombutton.dart';
import 'package:travel_planner/feature/profile/logic/cubit/profile_cubit.dart';

class WidgetFieldUpdateProfile extends StatelessWidget {
  final ProfileCubit cubit;
  const WidgetFieldUpdateProfile({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Costomtextformfield(
          hinttext: 'name',
          prefixicon: Icons.person,
          controller: cubit.name,
        ),
        SizedBox(height: 5.h),
        Costomtextformfield(
          hinttext: 'email',
          prefixicon: Icons.email,
          controller: cubit.email,
        ),
        SizedBox(height: 5.h),
        Costomtextformfield(
          hinttext: 'phone number',
          typekeybord: .number,
          prefixicon: Icons.phone,
          controller: cubit.phone,
        ),
        SizedBox(height: 100.h),
        Custombutton(
          onPressed: () async {
            await cubit.updateProfile();
          },
          isRectangleBorder: true,
          radiusRectangleBorder: 10,
          child: Text("Update Profile"),
        ),
      ],
    );
  }
}
