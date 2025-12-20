import 'package:equatable/equatable.dart';

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
  // final ForgetPasswordResponse response;
  // FavouriteSuccess(this.response);
  @override
  List<Object?> get props => [
    // response
  ];
}

class FavouriteError extends FavouriteState {
  // final Failure error;
  // FavouriteError(this.error);
  @override
  List<Object?> get props => [
    // error
  ];
}
