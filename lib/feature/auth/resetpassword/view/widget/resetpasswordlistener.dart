// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_planner/core/helper/dialoghelper.dart';
import 'package:travel_planner/core/routing/const_rout.dart';
import 'package:travel_planner/feature/auth/resetpassword/logic/cubit/resetpassword_cubit.dart';

class Resetpasswordlistener extends StatelessWidget {
  const Resetpasswordlistener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ResetpasswordCubit, ResetpasswordState>(
      listener: (context, state) {
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
        }
        if (state is ResetpasswordLoading) {
          myDialog(
            context,
            title: "loading..",
            content: CircularProgressIndicator(color: Colors.green),
          );
        } else if (state is ResetpasswordError) {
          myDialog(
            context,
            title: state.error.message,
            content: const Icon(Icons.error, color: Colors.red),
          );
        } else if (state is ResetpasswordSuccess) {
          myDialog(
            context,
            title: "reset password success",
            content: const Icon(Icons.done, color: Colors.green),
          );
          Future.delayed(const Duration(milliseconds: 600), () {
            if (Navigator.canPop(context)) Navigator.pop(context);
            context.go(Routconst.login);
          });
        } else if (state is ResendCodeSuccess) {
          myDialog(
            context,
            title: "resend verify code success",
            content: const Icon(Icons.done, color: Colors.green),
          );
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
