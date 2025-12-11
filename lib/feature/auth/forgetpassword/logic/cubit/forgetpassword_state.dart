part of 'forgetpassword_cubit.dart';

sealed class ForgetpasswordState extends Equatable {}

class ForgetpasswordInitial extends ForgetpasswordState {
  @override
  List<Object?> get props => [];
}

class ForgetpasswordLoading extends ForgetpasswordState {
  ForgetpasswordLoading();
  @override
  List<Object?> get props => [];
}

class ForgetpasswordSuccess extends ForgetpasswordState {
  final ForgetPasswordResponse response;
  ForgetpasswordSuccess(this.response);
  @override
  List<Object?> get props => [response];
}

class ForgetpasswordError extends ForgetpasswordState {
  final Failure error;
  ForgetpasswordError(this.error);
  @override
  List<Object?> get props => [error];
}
