part of 'login_cubit.dart';

sealed class LoginState extends Equatable {}

class LoginInitial extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginLoading extends LoginState {
  LoginLoading();
  @override
  List<Object?> get props => [];
}

class LoginSuccess extends LoginState {
  final LoginResponse response;
  LoginSuccess(this.response);
  @override
  List<Object?> get props => [response];
}

class LoginError extends LoginState {
  final Failure error;
  LoginError(this.error);
  @override
  List<Object?> get props => [error];
}
