import 'package:equatable/equatable.dart';

sealed class SettingState extends Equatable {}

class SettingInitial extends SettingState {
  @override
  List<Object?> get props => [];
}

class SettingLoading extends SettingState {
  SettingLoading();
  @override
  List<Object?> get props => [];
}

class SettingSuccess extends SettingState {
  // final ForgetPasswordResponse response;
  // FavouriteSuccess(this.response);
  @override
  List<Object?> get props => [
    // response
  ];
}

class SettingError extends SettingState {
  // final Failure error;
  // FavouriteError(this.error);
  @override
  List<Object?> get props => [
    // error
  ];
}
