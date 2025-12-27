import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_planner/core/helper/dialoghelper.dart';
import 'package:travel_planner/core/routing/const_rout.dart';
import 'package:travel_planner/feature/profile/logic/cubit/profile_cubit.dart';
import 'package:travel_planner/feature/profile/logic/cubit/profile_state.dart';
import 'package:travel_planner/feature/profile/view/widget/widgetfieldupdatepassword.dart';

class UpdatePassword extends StatelessWidget {
  const UpdatePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Password"),
        foregroundColor: Colors.green,
        centerTitle: true,
      ),
      body: BlocListener<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is ProfileError) {
            myDialog(
              context,
              title: state.error.message,
              content: const Icon(Icons.error, color: Colors.red),
            );
          }
          if (state is PasswordChangedSuccess) {
            context.go(Routconst.profile);
          }
        },
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            final cubit = context.read<ProfileCubit>();
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: WidgetFieldUpdatePassword(cubit: cubit),
              ),
            );
          },
        ),
      ),
    );
  }
}
