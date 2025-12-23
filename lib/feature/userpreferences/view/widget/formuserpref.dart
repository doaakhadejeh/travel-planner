import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_planner/core/widget/costomtextformfield.dart';
import 'package:travel_planner/feature/userpreferences/logic/cubit/userpreferences_cubit.dart';

class UserPreferencesForm extends StatelessWidget {
  const UserPreferencesForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UserpreferencesCubit>();
    return Column(
      crossAxisAlignment: .start,
      children: [
        Costomtextformfield(
          hinttext: 'travel_style',
          prefixicon: Icons.explore,
          controller: cubit.travelStyle,
        ),
        Row(
          children: [
            Expanded(
              child: Costomtextformfield(
                hinttext: 'preferred_budget_min',
                prefixicon: Icons.trending_down,
                validatortext: 'please fill this field!',
                controller: cubit.preferredBudgetMin,
                typekeybord: .number,
              ),
            ),
            Expanded(
              child: Costomtextformfield(
                hinttext: 'preferred_budget_max',
                prefixicon: Icons.trending_up,
                validatortext: 'please fill this field!',
                controller: cubit.preferredBudgetMax,
                typekeybord: .number,
              ),
            ),
          ],
        ),
        Costomtextformfield(
          hinttext: 'preferred_countries',
          prefixicon: Icons.public,
          validatortext: 'please fill this field!',
          controller: cubit.preferredCountries,
        ),
        Costomtextformfield(
          hinttext: 'preferred_food',
          prefixicon: Icons.restaurant,
          validatortext: 'please fill this field!',
          controller: cubit.preferredFood,
        ),
        Costomtextformfield(
          hinttext: 'interests',
          prefixicon: Icons.star,
          validatortext: 'please fill this field!',
          controller: cubit.interests,
        ),
      ],
    );
  }
}
