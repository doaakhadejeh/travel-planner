import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_planner/feature/favourite/data/remote/favouriteremote.dart';
import 'package:travel_planner/feature/favourite/logic/cubit/favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  final Favouritedata favouritedata;
  FavouriteCubit(this.favouritedata) : super(FavouriteInitial());
  Set<int> favouriteTripIds = {};

  Future<void> getFavourite() async {
    emit(FavouriteLoading());
    final response = await favouritedata.myFavourite();
    response.fold(
      (failure) {
        emit(FavouriteError(failure));
      },
      (favouriteResponse) {
        favouriteTripIds = favouriteResponse.map((e) => e.trip.id).toSet();
        emit(FavouriteSuccess(favouriteResponse));
      },
    );
  }

  Future<void> toggleFavourite(int tripId) async {
    final isAdded = favouriteTripIds.contains(tripId);

    if (isAdded) {
      favouriteTripIds.remove(tripId);
    } else {
      favouriteTripIds.add(tripId);
    }
    emit(FavouriteUpdated(favouriteTripIds));

    final response = isAdded
        ? await favouritedata.removeFavourite(tripId)
        : await favouritedata.addFavourite(tripId);

    response.fold((f) {
      if (isAdded) {
        favouriteTripIds.add(tripId);
      } else {
        favouriteTripIds.remove(tripId);
      }
      emit(FavouriteError(f));
    }, (_) {});
  }
}
