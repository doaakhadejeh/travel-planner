import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_planner/core/model/usermodel.dart';

class TopWidgetSuccessUser extends StatelessWidget {
  final UserResponse user;
  const TopWidgetSuccessUser({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.h,
      width: 70.w,
      child: CircleAvatar(
        backgroundColor: user.profileImage == '' ? Colors.green.shade100 : null,
        radius: 24.r,
        backgroundImage: user.profileImage != null
            ? NetworkImage(
                'http://192.168.42.196:8000/storage/${user.profileImage}',
              )
            : null,
        child: user.profileImage == ''
            ? const Icon(Icons.person, size: 40)
            : null,
      ),
    );
  }
}
