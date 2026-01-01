import 'package:equatable/equatable.dart';
import 'package:travel_planner/core/model/usermodel.dart';
import 'package:travel_planner/core/network/api_error_model.dart';

sealed class UserAdminState extends Equatable {}

class UserAdminInitial extends UserAdminState {
  @override
  List<Object?> get props => [];
}

class UserAdminLoading extends UserAdminState {
  UserAdminLoading();
  @override
  List<Object?> get props => [];
}

class UserAdminSuccess extends UserAdminState {
  final List<UserResponse> response;
  UserAdminSuccess(this.response);
  @override
  List<Object?> get props => [response];
}

class ToggleUserBlockSuccess extends UserAdminState {
  final UserResponse response;
  ToggleUserBlockSuccess(this.response);
  @override
  List<Object?> get props => [response];
}

class UserAdminError extends UserAdminState {
  final Failure error;
  UserAdminError(this.error);
  @override
  List<Object?> get props => [error];
}
