import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_planner/core/widget/costomtextformfield.dart';
import 'package:travel_planner/feature/auth/resetpassword/logic/cubit/resetpassword_cubit.dart';

class Fieldresetpassword extends StatefulWidget {
  const Fieldresetpassword({super.key});

  @override
  State<Fieldresetpassword> createState() => _FieldresetpasswordState();
}

class _FieldresetpasswordState extends State<Fieldresetpassword> {
  bool hidepassword = true;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ResetpasswordCubit>();

    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
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
          SizedBox(height: 30.h),
          Text(
            "    Complete the fields:",
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
          SizedBox(height: 3.h),
          Costomtextformfield(
            hinttext: 'new password',
            prefixicon: hidepassword ? Icons.visibility_off : Icons.visibility,
            obscureText: hidepassword,
            showtext: () {
              setState(() {
                hidepassword = !hidepassword;
              });
            },
            controller: cubit.password,
            validatortext: "enter your password",
          ),
          SizedBox(height: 3.h),
          Costomtextformfield(
            hinttext: 'confirm password',
            prefixicon: hidepassword ? Icons.visibility_off : Icons.visibility,
            obscureText: hidepassword,
            showtext: () {
              setState(() {
                hidepassword = !hidepassword;
              });
            },
            controller: cubit.confirmationPassword,
            validatortext: "confirm your email",
          ),
        ],
      ),
    );
  }
}
