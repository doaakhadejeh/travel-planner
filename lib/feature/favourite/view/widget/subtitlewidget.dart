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
    return Column(
      children: [
        Text('the budget:${favourite.trip.budget}'),
        SizedBox(height: 5.h),
        Text('start day:${favourite.trip.startDay}'),
        SizedBox(height: 5.h),
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
                favourite.trip.isFavourite
                    ? Icons.favorite
                    : Icons.favorite_border,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
