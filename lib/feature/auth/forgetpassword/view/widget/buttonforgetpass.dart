import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_planner/core/widget/custombutton.dart';
import 'package:travel_planner/feature/auth/forgetpassword/logic/cubit/forgetpassword_cubit.dart';

class Buttonforgetpassword extends StatelessWidget {
  const Buttonforgetpassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 14.w),
      child: BlocBuilder<ForgetpasswordCubit, ForgetpasswordState>(
        builder: (context, state) {
          if (state is ForgetpasswordLoading) {
            return Center(
              child: CircularProgressIndicator(color: Colors.green),
            );
          }

          return Custombutton(
            onPressed: () {
              if (context
                  .read<ForgetpasswordCubit>()
                  .formKey
                  .currentState!
                  .validate()) {
                context.read<ForgetpasswordCubit>().forgetpassword();
              }
            },
            backgroundColor: Colors.green.shade200,
            isRectangleBorder: true,
            radiusRectangleBorder: 10.sp,
            child: Text("verify"),
          );
        },
      ),
    );
  }
}
