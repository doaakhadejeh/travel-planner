import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_planner/core/widget/costomtextformfield.dart';
import 'package:travel_planner/core/widget/custombutton.dart';
import 'package:travel_planner/feature/profile/logic/cubit/profile_cubit.dart';

class WidgetFieldUpdatePassword extends StatefulWidget {
  final ProfileCubit cubit;
  const WidgetFieldUpdatePassword({super.key, required this.cubit});

  @override
  State<WidgetFieldUpdatePassword> createState() =>
      _WidgetFieldUpdatePasswordState();
}

class _WidgetFieldUpdatePasswordState extends State<WidgetFieldUpdatePassword> {
  bool hidepassword = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.cubit.key,
      child: Column(
        children: [
          Costomtextformfield(
            hinttext: 'old password',
            prefixicon: hidepassword ? Icons.visibility_off : Icons.visibility,
            obscureText: hidepassword,
            showtext: () {
              setState(() {
                hidepassword = !hidepassword;
              });
            },
            controller: widget.cubit.oldPassword,
            validatortext: "please enter your old password",
          ),
          SizedBox(height: 3.h),
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
            controller: widget.cubit.newPassword,
            validatortext: "please enter your new password",
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
            controller: widget.cubit.confirmPassword,
            validatortext: "please confirm your password",
          ),
          SizedBox(height: 60.h),
          Custombutton(
            onPressed: () async {
              if (widget.cubit.key.currentState!.validate()) {
                await widget.cubit.updatePassword();
              }
            },
            isRectangleBorder: true,
            radiusRectangleBorder: 20,
            child: Text("Update Password"),
          ),
        ],
      ),
    );
  }
}
