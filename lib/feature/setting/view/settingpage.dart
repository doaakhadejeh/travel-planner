import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_planner/core/di/dependcy_injection.dart';
import 'package:travel_planner/feature/setting/logic/cubit/setting_cubit.dart';
import 'package:travel_planner/feature/setting/view/setting.dart';

class Settingpage extends StatelessWidget {
  const Settingpage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => getIt<SettingCubit>(), child: Setting());
  }
}
