import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_planner/core/model/usermodel.dart';
import 'package:travel_planner/feature/useradmin/view/widget/buttonblockuser.dart';
import 'package:travel_planner/feature/useradmin/view/widget/contentwidgetsuccess.dart';
import 'package:travel_planner/feature/useradmin/view/widget/topwidgetsuccess.dart';

class WidgetSuccess extends StatelessWidget {
  final List<UserResponse> users;
  const WidgetSuccess({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(16.w),
      itemCount: users.length,
      separatorBuilder: (_, _) => SizedBox(height: 12.h),
      itemBuilder: (context, index) {
        final user = users[index];

        return Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Row(
              children: [
                TopWidgetSuccessUser(user: user),
                SizedBox(width: 16.w),
                ContentWidgetSuccessUser(user: user),
                const SizedBox(width: 8),
                ButtonBlockUser(user: user),
              ],
            ),
          ),
        );
      },
    );
  }
}
