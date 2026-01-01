import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_planner/feature/profile/data/model/profilemodel.dart';
import 'package:travel_planner/feature/profile/logic/cubit/profile_cubit.dart';
import 'package:travel_planner/feature/profile/view/widget/showimagebottomsheet.dart';

class TopWidgetSuccess extends StatelessWidget {
  final ProfileResponse profile;
  const TopWidgetSuccess({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: Row(
        mainAxisAlignment: .center,
        crossAxisAlignment: .center,
        children: [
          IconButton(
            icon: Icon(Icons.edit, color: Colors.green, size: 20.sp),
            onPressed: () {
              final cubit = context.read<ProfileCubit>();
              showImagePickerBottomSheet(context, cubit);
            },
          ),
          SizedBox(
            height: 120.h,
            width: 120.w,
            child: CircleAvatar(
              radius: 45,
              backgroundImage: profile.profileImage.isNotEmpty
                  ? NetworkImage(
                      'http://192.168.42.196:8000/storage/${profile.profileImage}',
                    )
                  : null,
              child: profile.profileImage.isEmpty
                  ? const Icon(Icons.person, size: 40)
                  : null,
            ),
          ),
          SizedBox(width: 25.w),
        ],
      ),
    );
  }
}
