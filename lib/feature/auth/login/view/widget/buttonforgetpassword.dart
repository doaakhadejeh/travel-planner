import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_planner/core/routing/const_rout.dart';

class ButtonforgetpasswordLogin extends StatelessWidget {
  const ButtonforgetpasswordLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          context.go(Routconst.forgetpassword);
        },
        child: Text(
          "forget my password!",
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
