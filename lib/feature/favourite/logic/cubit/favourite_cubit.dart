import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_planner/feature/favourite/data/remote/favouriteremote.dart';
import 'package:travel_planner/feature/favourite/logic/cubit/favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  final Favouritedata favouritedata;
  FavouriteCubit(this.favouritedata) : super(FavouriteInitial());

  Future<void> getFavourite() async {
    emit(FavouriteLoading());
    final response = await favouritedata.myFavourite();
    response.fold(
      (failure) {
        emit(FavouriteError(failure));
      },
      (favouriteResponse) {
        emit(FavouriteSuccess(favouriteResponse));
      },
    );
  }

  Future<void> toggleFavourite(int tripId) async {
    if (state is! FavouriteSuccess) return;

    final currentState = state as FavouriteSuccess;

    final updatedList = [...currentState.response];

    final index = updatedList.indexWhere((f) => f.trip.id == tripId);
    if (index == -1) return;

    final favItem = updatedList[index];

    favItem.trip.isFavourite = !favItem.trip.isFavourite;

    emit(FavouriteSuccess(updatedList));

    final response = favItem.trip.isFavourite
        ? await favouritedata.addFavourite(tripId)
        : await favouritedata.removeFavourite(tripId);

    response.fold((failure) {
      favItem.trip.isFavourite = !favItem.trip.isFavourite;
      emit(FavouriteError(failure));
      emit(FavouriteSuccess(updatedList));
    }, (_) {});
  }
}
