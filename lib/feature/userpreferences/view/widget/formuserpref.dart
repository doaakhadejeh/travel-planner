import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_planner/core/widget/costomtextformfield.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          hinttext: 'travel style',
          prefixicon: Icons.explore,
          controller: cubit.travelStyle,
        ),
        SizedBox(height: 5.h),
        Row(
          children: [
            Expanded(
              child: Costomtextformfield(
                hinttext: 'budget min',
                prefixicon: Icons.trending_down,
                validatortext: 'please fill this field!',
                controller: cubit.preferredBudgetMin,
                typekeybord: .number,
              ),
            ),
            SizedBox(width: 5.w),
            Expanded(
              child: Costomtextformfield(
                hinttext: 'budget max',
                prefixicon: Icons.trending_up,
                validatortext: 'please fill this field!',
                controller: cubit.preferredBudgetMax,
                typekeybord: .number,
              ),
            ),
          ],
        ),
        SizedBox(height: 5.h),
        Costomtextformfield(
          hinttext: 'preferred countries',
          prefixicon: Icons.public,
          validatortext: 'please fill this field!',
          controller: cubit.preferredCountries,
        ),
        SizedBox(height: 5.h),
        Costomtextformfield(
          hinttext: 'preferred food',
          prefixicon: Icons.restaurant,
          validatortext: 'please fill this field!',
          controller: cubit.preferredFood,
        ),
        SizedBox(height: 5.h),
        Costomtextformfield(
          hinttext: 'interests',
          prefixicon: Icons.star,
          validatortext: 'please fill this field!',
          controller: cubit.interests,
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
