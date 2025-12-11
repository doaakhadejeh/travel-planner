import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_planner/core/widget/costomtextformfield.dart';
import 'package:travel_planner/feature/auth/verifyemail/logic/cubit/verifyemail_cubit.dart';

class Fieldverifycode extends StatelessWidget {
  const Fieldverifycode({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<VerifyemailCubit>();

    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          Text(
            "   Enter your email:",
            style: TextStyle(
              fontWeight: .bold,
              fontSize: 11.sp,
              color: Colors.grey,
            ),
          ),

          SizedBox(height: 10.h),
          Costomtextformfield(
            hinttext: 'email',
            prefixicon: Icons.email,
            controller: cubit.email,
            validatortext: "enter your email",
          ),
          SizedBox(height: 40.h),
          Text(
            "   Enter the verification code:",
            style: TextStyle(
              fontWeight: .bold,
              fontSize: 11.sp,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 10.h),

          OtpTextField(
            numberOfFields: 6,
            borderColor: Colors.green,
            showFieldAsBox: true,
            focusedBorderColor: Colors.green.shade200,
            enabledBorderColor: Colors.green,
            disabledBorderColor: Colors.green,
            onSubmit: (String verificationCode) {
              cubit.code.text = verificationCode;
            },
          ),
        ],
      ),
    );
  }
}
