import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_planner/core/widget/costomtextformfield.dart';
import 'package:travel_planner/feature/auth/register/logic/cubit/register_cubit.dart';

class Fieldregister extends StatefulWidget {
  const Fieldregister({super.key});

  @override
  State<Fieldregister> createState() => _FieldregisterState();
}

class _FieldregisterState extends State<Fieldregister> {
  bool hidepassword = true;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RegisterCubit>();

    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          Costomtextformfield(
            hinttext: 'name',
            prefixicon: Icons.person,
            controller: cubit.name,
            validatortext: "please enter your name",
          ),
          SizedBox(height: 3.h),
          Costomtextformfield(
            hinttext: 'email',
            prefixicon: Icons.email,
            controller: cubit.email,
            validatortext: "please enter your email",
          ),
          SizedBox(height: 3.h),
          Costomtextformfield(
            hinttext: 'password',
            prefixicon: hidepassword ? Icons.visibility_off : Icons.visibility,
            obscureText: hidepassword,
            showtext: () {
              setState(() {
                hidepassword = !hidepassword;
              });
            },
            controller: cubit.password,
            validatortext: "please enter your password",
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
            validatortext: "please confirm your password",
          ),
          SizedBox(height: 3.h),
          Costomtextformfield(
            hinttext: 'phone number',
            typekeybord: .number,
            prefixicon: Icons.phone,
            controller: cubit.phoneNumber,
            validatortext: "please enter your phone number",
          ),
        ],
      ),
    );
  }
}
