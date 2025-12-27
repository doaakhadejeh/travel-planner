import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_planner/feature/favourite/data/model/favouritemodel.dart';
import 'package:travel_planner/feature/favourite/logic/cubit/favourite_cubit.dart'
    show FavouriteCubit;

class SubtitleWidget extends StatelessWidget {
  final FavouriteResponse favourite;
  const SubtitleWidget({super.key, required this.favourite});

  @override
  Widget build(BuildContext context) {
    final favCubit = context.watch<FavouriteCubit>();
    final isFav = favCubit.favouriteTripIds.contains(favourite.trip.id);
    return Column(
      crossAxisAlignment: .start,
      children: [
        SizedBox(height: 5.h),
        Text('the budget:${favourite.trip.budget}'),
        SizedBox(height: 2.h),
        Text(
          'start day:${DateFormat('yyyy-MM-dd').format(favourite.trip.startDay)}',
        ),
        SizedBox(height: 7.h),
        Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Text('${favourite.trip.days} days'),
            IconButton(
              onPressed: () {
                context.read<FavouriteCubit>().toggleFavourite(
                  favourite.trip.id,
                );
              },
              icon: Icon(
                isFav ? Icons.favorite : Icons.favorite_border,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
