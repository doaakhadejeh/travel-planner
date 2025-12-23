import 'package:equatable/equatable.dart';
import 'package:travel_planner/core/network/api_error_model.dart';
import 'package:travel_planner/feature/userpreferences/data/model/userpreferencesmodel.dart';

sealed class UserpreferencesState extends Equatable {}

class UserpreferencesInitial extends UserpreferencesState {
  @override
  List<Object?> get props => [];
}

class UserpreferencesLoading extends UserpreferencesState {
  UserpreferencesLoading();
  @override
  List<Object?> get props => [];
}

class UserpreferencesSuccess extends UserpreferencesState {
  final List<UserPreferenceResponse> response;
  UserpreferencesSuccess(this.response);
  @override
  List<Object?> get props => [response];
}

class UserpreferencesError extends UserpreferencesState {
  final Failure error;
  UserpreferencesError(this.error);
  @override
  List<Object?> get props => [error];
}
