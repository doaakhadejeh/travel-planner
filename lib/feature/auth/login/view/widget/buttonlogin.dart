import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_planner/core/widget/custombutton.dart';
import 'package:travel_planner/feature/auth/login/logic/cubit/login_cubit.dart';

class Buttonlogin extends StatelessWidget {
  const Buttonlogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 10.w),
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          if (state is LoginLoading) {
            return Center(
              child: CircularProgressIndicator(color: Colors.green),
            );
          }
          return Custombutton(
            onPressed: () {
              if (context.read<LoginCubit>().formKey.currentState!.validate()) {
                context.read<LoginCubit>().login();
              }
            },
            isRectangleBorder: true,
            radiusRectangleBorder: 10.sp,
            child: Text("Login"),
          );
        },
      ),
    );
  }
}
