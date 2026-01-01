import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_planner/core/helper/dialoghelper.dart';
import 'package:travel_planner/feature/useradmin/logic/cubit/user_admin_cubit.dart';
import 'package:travel_planner/feature/useradmin/logic/cubit/user_admin_state.dart';
import 'package:travel_planner/feature/useradmin/view/widget/widgetsuccess.dart';

class UserAdmin extends StatelessWidget {
  const UserAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Users Management"), centerTitle: true),
      body: BlocListener<UserAdminCubit, UserAdminState>(
        listener: (context, state) {
          if (state is UserAdminError) {
            myDialog(
              context,
              title: state.error.message,
              content: const Icon(Icons.error, color: Colors.red),
            );
          }
          if (state is ToggleUserBlockSuccess) {
            myDialog(
              context,
              title: 'User status updated',
              content: const Icon(Icons.done, color: Colors.green),
            );
          }
        },
        child: BlocBuilder<UserAdminCubit, UserAdminState>(
          builder: (context, state) {
            if (state is UserAdminLoading) {
              return Center(
                child: CircularProgressIndicator(color: Colors.green),
              );
            } else if (state is UserAdminSuccess) {
              final users = state.response;
              if (users.isEmpty) {
                return const Center(child: Text("No users found"));
              }

              return WidgetSuccess(users: users);
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
