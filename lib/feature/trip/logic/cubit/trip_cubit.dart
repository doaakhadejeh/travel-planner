import 'package:flutter_bloc/flutter_bloc.dart';
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
}
