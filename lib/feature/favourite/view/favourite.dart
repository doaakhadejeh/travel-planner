import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_planner/core/helper/dialoghelper.dart';
import 'package:travel_planner/feature/favourite/logic/cubit/favourite_cubit.dart';
import 'package:travel_planner/feature/favourite/logic/cubit/favourite_state.dart';
import 'package:travel_planner/feature/favourite/view/widget/loadingwidget.dart';
import 'package:travel_planner/feature/favourite/view/widget/successwidget.dart';

class Favourite extends StatelessWidget {
  const Favourite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Favourite",
          style: TextStyle(fontWeight: .bold, fontSize: 30.sp),
        ),
        centerTitle: true,
      ),
      body: BlocListener<FavouriteCubit, FavouriteState>(
        listener: (context, state) {
          if (state is FavouriteError) {
            myDialog(
              context,
              title: state.error.message,
              content: const Icon(Icons.error, color: Colors.red),
            );
          }
        },
        child: BlocBuilder<FavouriteCubit, FavouriteState>(
          builder: (context, state) {
            if (state is FavouriteLoading) {
              return LoadingWidget();
            }
            if (state is FavouriteSuccess) {
              final favourites = state.response;
              if (favourites.isEmpty) {
                return Center(child: Text("No favourites yet!"));
              }
              return SuccessWidget(favourites: favourites);
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
