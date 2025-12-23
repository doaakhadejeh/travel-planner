import 'package:equatable/equatable.dart';
import 'package:travel_planner/core/network/api_error_model.dart';
import 'package:travel_planner/feature/favourite/data/model/favouritemodel.dart';

sealed class FavouriteState extends Equatable {}

class FavouriteInitial extends FavouriteState {
  @override
  List<Object?> get props => [];
}

class FavouriteLoading extends FavouriteState {
  FavouriteLoading();
  @override
  List<Object?> get props => [];
}

class FavouriteSuccess extends FavouriteState {
  final List<FavouriteResponse> response;
  FavouriteSuccess(this.response);
  @override
  List<Object?> get props => [response];
}

class FavouriteError extends FavouriteState {
  final Failure error;
  FavouriteError(this.error);
  @override
  List<Object?> get props => [error];
}
