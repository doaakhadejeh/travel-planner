import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_planner/core/widget/costomtextformfield.dart';
import 'package:travel_planner/feature/auth/login/logic/cubit/login_cubit.dart';

class Emilandpassword extends StatefulWidget {
  const Emilandpassword({super.key});

  @override
  State<Emilandpassword> createState() => _EmilandpasswordState();
}

class _EmilandpasswordState extends State<Emilandpassword> {
  bool hidepassword = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          Costomtextformfield(
            hinttext: 'email',
            prefixicon: Icons.email,
            controller: context.read<LoginCubit>().email,
            validatortext: "please enter correct email",
          ),
          SizedBox(height: 5.h),
          Costomtextformfield(
            hinttext: 'password',
            prefixicon: hidepassword ? Icons.visibility_off : Icons.visibility,
            obscureText: hidepassword,
            showtext: () {
              setState(() {
                hidepassword = !hidepassword;
              });
            },
            controller: context.read<LoginCubit>().password,
            validatortext: "please enter correct password",
          ),
        ],
      ),
    );
  }
}
