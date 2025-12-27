import 'package:equatable/equatable.dart';
import 'package:travel_planner/core/network/api_error_model.dart';
import 'package:travel_planner/feature/profile/data/model/profilemodel.dart';

sealed class ProfileState extends Equatable {}

class ProfileInitial extends ProfileState {
  @override
  List<Object?> get props => [];
}

class ProfileLoading extends ProfileState {
  ProfileLoading();
  @override
  List<Object?> get props => [];
}

class ProfileSuccess extends ProfileState {
  final ProfileResponse response;
  ProfileSuccess(this.response);
  @override
  List<Object?> get props => [response];
}

class ProfileError extends ProfileState {
  final Failure error;
  ProfileError(this.error);
  @override
  List<Object?> get props => [error];
}

class ProfileUpdateSuccess extends ProfileState {
  final ProfileResponse response;
  ProfileUpdateSuccess(this.response);
  @override
  List<Object?> get props => [response];
}

class ProfileImageUpdated extends ProfileState {
  final ProfileResponse response;
  ProfileImageUpdated(this.response);
  @override
  List<Object?> get props => [response];
}

class PasswordChangedSuccess extends ProfileState {
  @override
  List<Object?> get props => [];
}
