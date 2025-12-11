part of 'register_cubit.dart';

sealed class RegisterState extends Equatable {}

final class RegisterInitial extends RegisterState {
  @override
  List<Object?> get props => [];
}

final class RegisterLoading extends RegisterState {
  @override
  List<Object?> get props => [];
}

final class RegisterSuccess extends RegisterState {
  final RegisterResponse response;
  RegisterSuccess(this.response);
  @override
  List<Object?> get props => [response];
}

class RegisterError extends RegisterState {
  final Failure error;
  RegisterError(this.error);
  @override
  List<Object?> get props => [error];
}
