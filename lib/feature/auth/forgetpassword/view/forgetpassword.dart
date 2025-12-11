import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_planner/core/widget/costomtextformfield.dart';
import 'package:travel_planner/feature/auth/forgetpassword/logic/cubit/forgetpassword_cubit.dart';
import 'package:travel_planner/feature/auth/forgetpassword/view/widget/buttonforgetpass.dart';
import 'package:travel_planner/feature/auth/forgetpassword/view/widget/listenerforgetpassword.dart';
import 'package:travel_planner/feature/auth/forgetpassword/view/widget/topforgetpass.dart';

class Forgetpassword extends StatelessWidget {
  const Forgetpassword({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ForgetpasswordCubit>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            SizedBox(height: 20.h),
            Topforgetpassword(),
            SizedBox(height: 10.h),
            Form(
              key: cubit.formKey,
              child: Costomtextformfield(
                hinttext: 'email',
                prefixicon: Icons.email,
                controller: cubit.email,
                validatortext: "Please enter a valid email",
              ),
            ),
            SizedBox(height: 30.h),
            Buttonforgetpassword(),
            Listenerforgetpassword(),
          ],
        ),
      ),
    );
  }
}
