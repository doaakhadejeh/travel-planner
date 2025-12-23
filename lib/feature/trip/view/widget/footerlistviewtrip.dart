import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_planner/feature/favourite/logic/cubit/favourite_cubit.dart';
import 'package:travel_planner/feature/favourite/logic/cubit/favourite_state.dart';
import 'package:travel_planner/feature/trip/data/model/tripmodel.dart';

class FooterListViewTrip extends StatelessWidget {
  final TripResponse trip;
  const FooterListViewTrip({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Text("the budget : ${trip.budget}\$"),
        BlocBuilder<FavouriteCubit, FavouriteState>(
          builder: (context, state) {
            return IconButton(
              onPressed: () {
                context.read<FavouriteCubit>().toggleFavourite(trip.id);
              },
              icon: Icon(
                trip.isFavourite ? Icons.favorite : Icons.favorite_border,
                color: Colors.red,
              ),
            );
          },
        ),
      ],
    );
  }
}
