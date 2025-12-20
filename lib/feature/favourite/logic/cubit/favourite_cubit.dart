import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_planner/feature/favourite/data/remote/favouriteremote.dart';
import 'package:travel_planner/feature/favourite/logic/cubit/favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  final Favouritedata favouritedata;
  FavouriteCubit(this.favouritedata) : super(FavouriteInitial());
}
