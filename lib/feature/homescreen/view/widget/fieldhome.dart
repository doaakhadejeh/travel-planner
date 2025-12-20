import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_planner/core/widget/costomtextformfield.dart';
import 'package:travel_planner/feature/homescreen/logic/cubit/homescreen_cubit.dart';

class FieldHome extends StatelessWidget {
  const FieldHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<HomescreenCubit>().formKey,
      child: Column(
        children: [
          SizedBox(height: 10.h),
          Text(
            "Please Fill This Field",

            style: TextStyle(
              color: Colors.white,
              fontSize: 27.sp,
              fontWeight: .bold,
            ),
          ),
          SizedBox(height: 20.h),

          Costomtextformfield(
            controller: context.read<HomescreenCubit>().country,
            hinttext: 'country',
            prefixicon: Icons.place,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13),
              borderSide: BorderSide(color: Colors.black),
            ),
            validatortext: "please enter country",
          ),
          SizedBox(height: 5.h),

          Costomtextformfield(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13),
              borderSide: BorderSide(color: Colors.black),
            ),
            controller: context.read<HomescreenCubit>().days,
            hinttext: 'days',
            prefixicon: Icons.calendar_month,
            typekeybord: .number,
            validatortext: "please enter days",
          ),
          SizedBox(height: 5.h),

          Costomtextformfield(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13),
              borderSide: BorderSide(color: Colors.black),
            ),
            controller: context.read<HomescreenCubit>().budget,
            hinttext: 'budget',
            prefixicon: Icons.monetization_on,
            typekeybord: .number,
            validatortext: "please enter budget",
          ),
        ],
      ),
    );
  }
}
