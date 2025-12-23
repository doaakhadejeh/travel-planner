import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_planner/core/helper/dialoghelper.dart';
import 'package:travel_planner/feature/userpreferences/logic/cubit/userpreferences_cubit.dart';
import 'package:travel_planner/feature/userpreferences/logic/cubit/userpreferences_state.dart';

class UserPrefListiner extends StatelessWidget {
  const UserPrefListiner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserpreferencesCubit, UserpreferencesState>(
      listener: (context, state) {
        if (state is UserpreferencesError) {
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
