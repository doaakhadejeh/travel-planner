import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_planner/core/di/dependcy_injection.dart';
import 'package:travel_planner/feature/favourite/logic/cubit/favourite_cubit.dart';
import 'package:travel_planner/feature/favourite/view/favourite.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<FavouriteCubit>(),
      child: Favourite(),
    );
  }
}
