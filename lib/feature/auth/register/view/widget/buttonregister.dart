import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_planner/core/widget/custombutton.dart';
import 'package:travel_planner/feature/auth/register/logic/cubit/register_cubit.dart';

class Buttonregister extends StatelessWidget {
  const Buttonregister({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        if (state is RegisterLoading) {
          return Center(child: CircularProgressIndicator(color: Colors.green));
        }
        return Custombutton(
          onPressed: () {
            if (context
                .read<RegisterCubit>()
                .formKey
                .currentState!
                .validate()) {
              context.read<RegisterCubit>().register();
            }
          },
          isRectangleBorder: true,
          radiusRectangleBorder: 10.sp,
          child: Text("register"),
        );
      },
    );
  }
}
