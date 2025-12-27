import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_planner/core/widget/custombutton.dart';
import 'package:travel_planner/feature/homescreen/logic/cubit/homescreen_cubit.dart';

class ButtonGenerateTrip extends StatelessWidget {
  const ButtonGenerateTrip({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Custombutton(
        backgroundColor: Colors.white,
        foregroundColor: Colors.green.shade800,
        borderColor: Colors.green.shade800,

        onPressed: () {
          if (context
              .read<HomescreenCubit>()
              .formKey
              .currentState!
              .validate()) {
            context.read<HomescreenCubit>().generateTrip();
          }
        },
        isRectangleBorder: true,
        radiusRectangleBorder: 10,
        child: Text("generate trip"),
      ),
    );
  }
}
