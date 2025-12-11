part of 'verifyemail_cubit.dart';

sealed class VerifyemailState extends Equatable {}

final class VerifyemailInitial extends VerifyemailState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class VerifyemailLoading extends VerifyemailState {
  VerifyemailLoading();
  @override
  List<Object?> get props => [];
}

class VerifyemailSuccess extends VerifyemailState {
  final VerifyEmailResponse response;
  VerifyemailSuccess(this.response);
  @override
  List<Object?> get props => [response];
}

class VerifyemailError extends VerifyemailState {
  final Failure error;
  VerifyemailError(this.error);
  @override
  List<Object?> get props => [error];
}

class ResendCodeSuccess extends VerifyemailState {
  final ResendCodeResponse response;
  ResendCodeSuccess(this.response);

  @override
  List<Object?> get props => [response];
}
