import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_planner/feature/trip/data/model/tripmodel.dart';
import 'package:travel_planner/feature/trip/data/remote/tripmodel.dart';
import 'package:travel_planner/feature/trip/logic/cubit/trip_state.dart';

class TripCubit extends Cubit<TripState> {
  final Tripdata tripdata;
  TripCubit(this.tripdata) : super(TripInitial());

  Future<void> getUserTrip() async {
    emit(TripLoading());
    final response = await tripdata.getUserTrip();
    response.fold(
      (failure) {
        emit(TripError(failure));
      },
      (tripResponse) {
        emit(TripSuccess(tripResponse));
      },
    );
  }

  void toggleFavourite(int tripId) {
    final trips = List<TripResponse>.from((state as TripSuccess).response);

    final index = trips.indexWhere((t) => t.id == tripId);
    if (index == -1) return;

    trips[index].isFavourite = !trips[index].isFavourite;

    emit(TripSuccess(trips));
  }
}
