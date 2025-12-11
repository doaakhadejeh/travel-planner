import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_planner/core/helper/dialoghelper.dart';
import 'package:travel_planner/core/routing/const_rout.dart';
import 'package:travel_planner/feature/auth/register/logic/cubit/register_cubit.dart';

class Listenerregister extends StatelessWidget {
  const Listenerregister({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          context.go(Routconst.verifyemail);
        } else if (state is RegisterError) {
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
