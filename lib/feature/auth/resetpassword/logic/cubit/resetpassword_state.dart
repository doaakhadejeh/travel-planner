part of 'resetpassword_cubit.dart';

sealed class ResetpasswordState extends Equatable {}

final class ResetpasswordInitial extends ResetpasswordState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class ResetpasswordLoading extends ResetpasswordState {
  ResetpasswordLoading();
  @override
  List<Object?> get props => [];
}

class ResetpasswordSuccess extends ResetpasswordState {
  final ResetPasswordResponse response;
  ResetpasswordSuccess(this.response);
  @override
  List<Object?> get props => [response];
}

class ResetpasswordError extends ResetpasswordState {
  final Failure error;
  ResetpasswordError(this.error);
  @override
  List<Object?> get props => [error];
}

class ResendCodeSuccess extends ResetpasswordState {
  final ResendCodeResponse response;
  ResendCodeSuccess(this.response);

  @override
  List<Object?> get props => [response];
}
