import 'package:equatable/equatable.dart';
import 'package:travel_planner/core/network/api_error_model.dart';
import 'package:travel_planner/feature/trip/data/model/tripmodel.dart';

sealed class TripState extends Equatable {}

class TripInitial extends TripState {
  @override
  List<Object?> get props => [];
}

class TripLoading extends TripState {
  TripLoading();
  @override
  List<Object?> get props => [];
}

class TripSuccess extends TripState {
  final List<TripResponse> response;
  TripSuccess(this.response);
  @override
  List<Object?> get props => [response];
}

class TripError extends TripState {
  final Failure error;
  TripError(this.error);
  @override
  List<Object?> get props => [error];
}
