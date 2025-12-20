import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_planner/feature/itineraryday/data/remote/itinerarydayremote.dart';
import 'package:travel_planner/feature/itineraryday/logic/cubit/itineraryday_state.dart';
import 'package:travel_planner/feature/trip/data/model/tripmodel.dart';

class ItineraryDayCubit extends Cubit<ItineraryDayState> {
  final Itinerarydaydata itinerarydaydata;
  TripResponse? _trip;
  ItineraryDayCubit(this.itinerarydaydata) : super(ItineraryDayInitial());

  void setTrip(TripResponse trip) {
    _trip = trip;
  }

  Future<void> getTripDay() async {
    if (_trip == null) return;
    emit(ItineraryDayLoading());
    final response = await itinerarydaydata.getItineraryDay(_trip!.id);
    response.fold(
      (failure) {
        emit(ItineraryDayError(failure));
      },

      (itineraryDayResponse) {
        emit(ItineraryDaySuccess(itineraryDayResponse));
      },
    );
  }

  bool isToday(int dayNumber) {
    if (_trip == null) return false;

    final dayDate = _trip!.startDay.add(Duration(days: dayNumber - 1));

    final now = DateTime.now();

    return dayDate.year == now.year &&
        dayDate.month == now.month &&
        dayDate.day == now.day;
  }
}
