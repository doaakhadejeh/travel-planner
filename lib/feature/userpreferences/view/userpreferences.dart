import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_planner/feature/userpreferences/logic/cubit/userpreferences_cubit.dart';
import 'package:travel_planner/feature/userpreferences/view/widget/buttomsave.dart';
import 'package:travel_planner/feature/userpreferences/view/widget/formuserpref.dart';
import 'package:travel_planner/feature/userpreferences/view/widget/userpreflistiner.dart';

class UserPreferences extends StatelessWidget {
  const UserPreferences({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: .all(10),
        child: SingleChildScrollView(
          child: Form(
            key: context.read<UserpreferencesCubit>().formKey,
            child: Column(
              children: [
                Text("fill this field for help ai to generate your trip:"),
                UserPreferencesForm(),
                SavePreferenceButton(),
                UserPrefListiner(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
