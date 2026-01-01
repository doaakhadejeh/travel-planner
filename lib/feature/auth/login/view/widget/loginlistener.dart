import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_planner/core/helper/dialoghelper.dart';
import 'package:travel_planner/core/helper/sharedpref_helper.dart';
import 'package:travel_planner/core/routing/const_rout.dart';
import 'package:travel_planner/feature/auth/login/logic/cubit/login_cubit.dart';

class Loginlistener extends StatelessWidget {
  const Loginlistener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) async {
        final con = context.go;
        if (state is LoginSuccess) {
          if (state.response.role == 'admin') {
            // 1. إذا أدمن.. فوراً على صفحة الأدمن
            context.go(Routconst.homeAdmin);
          } else if (state.response.role == 'user') {
            // 2. إذا يوزر.. بنشوف التفضيلات
            // تأكدي من مسمى الحقل في الموديل (ممكن يكون hasPreferences أو حسب شو سميتيه)
            if (await SharedPrefHelper.getBool("hasPreferences") == true) {
              con(Routconst.home); // عنده تفضيلات.. عالبيت فوراً
            } else {
              con(Routconst.userPref); // ما عنده.. خليه يعبيهم
            }
          }
        } else if (state is LoginError) {
          if (state.error.message == "the email not verified") {
            context.go(Routconst.verifyemail);
          }
          myDialog(
            context,
            title: state.error.message,
            content: const Icon(Icons.error, color: Colors.red),
          );
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
