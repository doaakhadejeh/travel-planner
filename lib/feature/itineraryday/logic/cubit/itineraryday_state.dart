import 'package:equatable/equatable.dart';
import 'package:travel_planner/core/network/api_error_model.dart';
import 'package:travel_planner/feature/itineraryday/data/model/itineraraydaymodel.dart';

sealed class ItineraryDayState extends Equatable {}

class ItineraryDayInitial extends ItineraryDayState {
  @override
  List<Object?> get props => [];
}

class ItineraryDayLoading extends ItineraryDayState {
  ItineraryDayLoading();
  @override
  List<Object?> get props => [];
}

class ItineraryDaySuccess extends ItineraryDayState {
  final List<ItineraryDayResponse> response;
  ItineraryDaySuccess(this.response);
  @override
  List<Object?> get props => [response];
}

class ItineraryDayError extends ItineraryDayState {
  final Failure error;
  ItineraryDayError(this.error);
  @override
  List<Object?> get props => [error];
}
