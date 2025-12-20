import 'package:equatable/equatable.dart';
import 'package:travel_planner/core/network/api_error_model.dart';
import 'package:travel_planner/feature/homescreen/data/model/homescreenmodel.dart';

sealed class HomescreenState extends Equatable {}

class HomescreenInitial extends HomescreenState {
  @override
  List<Object?> get props => [];
}

class HomescreenLoading extends HomescreenState {
  HomescreenLoading();
  @override
  List<Object?> get props => [];
}

class HomescreenSuccess extends HomescreenState {
  final HomescreenResponse response;
  HomescreenSuccess(this.response);
  @override
  List<Object?> get props => [response];
}

class HomescreenError extends HomescreenState {
  final Failure error;
  HomescreenError(this.error);
  @override
  List<Object?> get props => [error];
}
