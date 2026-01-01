import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_planner/core/di/dependcy_injection.dart';
import 'package:travel_planner/feature/useradmin/logic/cubit/user_admin_cubit.dart';
import 'package:travel_planner/feature/useradmin/view/useradmin.dart';

class UserAdminpage extends StatelessWidget {
  const UserAdminpage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<UserAdminCubit>()..getUserTrip(),
      child: const UserAdmin(),
    );
  }
}
