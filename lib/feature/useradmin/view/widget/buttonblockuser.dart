import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_planner/core/model/usermodel.dart';
import 'package:travel_planner/feature/useradmin/logic/cubit/user_admin_cubit.dart';
import 'package:travel_planner/feature/useradmin/logic/cubit/user_admin_state.dart';

class ButtonBlockUser extends StatelessWidget {
  final UserResponse user;
  const ButtonBlockUser({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final isBlocked = context.read<UserAdminCubit>().userBlock.contains(
      user.id,
    );
    return BlocBuilder<UserAdminCubit, UserAdminState>(
      builder: (context, state) {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: .all(3.sp),
            foregroundColor: Colors.white,
            backgroundColor: isBlocked
                ? Colors.green.shade600
                : Colors.red.shade300,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
          onPressed: () {
            context.read<UserAdminCubit>().toggleUserBlock(user.id);
          },
          child: Text(
            isBlocked ? "Unblock" : "Block",
            style: TextStyle(fontSize: 10.sp),
          ),
        );
      },
    );
  }
}
