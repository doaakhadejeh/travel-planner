import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_planner/core/helper/dialoghelper.dart';
import 'package:travel_planner/core/routing/const_rout.dart';
import 'package:travel_planner/feature/auth/forgetpassword/logic/cubit/forgetpassword_cubit.dart';

class Listenerforgetpassword extends StatelessWidget {
  const Listenerforgetpassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgetpasswordCubit, ForgetpasswordState>(
      listener: (context, state) {
        if (state is ForgetpasswordSuccess) {
          context.go(Routconst.resetpassword);
        } else if (state is ForgetpasswordError) {
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
