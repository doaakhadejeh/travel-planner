import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_planner/core/di/dependcy_injection.dart';
import 'package:travel_planner/feature/homescreen/logic/cubit/homescreen_cubit.dart';
import 'package:travel_planner/feature/homescreen/view/homescreen.dart';

class HomescreenPage extends StatelessWidget {
  const HomescreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<HomescreenCubit>(),
      child: const Homescreen(),
    );
  }
}
