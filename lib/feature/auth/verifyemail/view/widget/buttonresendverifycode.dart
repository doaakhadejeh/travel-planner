import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_planner/feature/auth/verifyemail/logic/cubit/verifyemail_cubit.dart';

class Buttonresendverifycode extends StatelessWidget {
  const Buttonresendverifycode({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () => context.read<VerifyemailCubit>().resendverifycode(),
        child: Text(
          "resend verification code!",
          style: TextStyle(
            fontWeight: .bold,
            color: Colors.green.shade400,
            fontSize: 9.sp,
          ),
        ),
      ),
    );
  }
}
