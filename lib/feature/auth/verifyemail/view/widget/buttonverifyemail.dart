import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_planner/core/widget/custombutton.dart';
import 'package:travel_planner/feature/auth/verifyemail/logic/cubit/verifyemail_cubit.dart';

class Buttonverifyemail extends StatelessWidget {
  const Buttonverifyemail({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 14.w),
      child: Custombutton(
        onPressed: () {
          if (context
              .read<VerifyemailCubit>()
              .formKey
              .currentState!
              .validate()) {
            context.read<VerifyemailCubit>().verifyemail();
          }
        },
        backgroundColor: Colors.green.shade200,
        isRectangleBorder: true,
        radiusRectangleBorder: 10.sp,
        child: Text("verify email"),
      ),
    );
  }
}
