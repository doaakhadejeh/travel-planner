import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_planner/core/widget/custombutton.dart';
import 'package:travel_planner/feature/userpreferences/logic/cubit/userpreferences_cubit.dart';
import 'package:travel_planner/feature/userpreferences/logic/cubit/userpreferences_state.dart';

class SavePreferenceButton extends StatelessWidget {
  const SavePreferenceButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserpreferencesCubit, UserpreferencesState>(
      builder: (context, state) {
        return Custombutton(
          onPressed: () => context.read<UserpreferencesCubit>().saveOrUpdate(),
          isRectangleBorder: true,
          radiusRectangleBorder: 10.sp,
          child: Text(
            state is UserpreferencesLoading
                ? "Saving..."
                : state is UserpreferencesSuccess && state.response.isNotEmpty
                ? "Update"
                : "Save",
          ),
        );
      },
    );
  }
}
