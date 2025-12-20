import 'package:equatable/equatable.dart';
import 'package:travel_planner/core/network/api_error_model.dart';
import 'package:travel_planner/feature/activity/data/model/activitymodel.dart';

sealed class ActivityState extends Equatable {}

class ActivityInitial extends ActivityState {
  @override
  List<Object?> get props => [];
}

class ActivityLoading extends ActivityState {
  ActivityLoading();
  @override
  List<Object?> get props => [];
}

class ActivitySuccess extends ActivityState {
  final List<ActivityResponse> response;
  ActivitySuccess(this.response);
  @override
  List<Object?> get props => [response];
}

class ActivityError extends ActivityState {
  final Failure error;
  ActivityError(this.error);
  @override
  List<Object?> get props => [error];
}
