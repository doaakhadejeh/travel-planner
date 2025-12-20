import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:travel_planner/core/network/api_error_model.dart';
import 'package:travel_planner/feature/auth/resetpassword/data/model/resendverifycodemodel.dart';
import 'package:travel_planner/feature/auth/resetpassword/data/model/resetpasswordmodel.dart';
import 'package:travel_planner/feature/auth/resetpassword/data/remote/resetpassremote.dart';

part 'resetpassword_state.dart';

class ResetpasswordCubit extends Cubit<ResetpasswordState> {
  final Resetpassdata resetpassdata;
  ResetpasswordCubit(this.resetpassdata) : super(ResetpasswordInitial());

  TextEditingController password = TextEditingController();
  TextEditingController confirmationPassword = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController code = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> resetPassword() async {
    emit(ResetpasswordLoading());
    final response = await resetpassdata.resetPassword(
      email.text,
      password.text,
      confirmationPassword.text,
      code.text,
    );
    response.fold(
      (failure) {
        emit(ResetpasswordError(failure));
      },
      (resetPasswordResponse) {
        emit(ResetpasswordSuccess(resetPasswordResponse));
      },
    );
  }

  Future<void> resendverifycode() async {
    emit(ResetpasswordLoading());
    final response = await resetpassdata.resendVerifyCode(email.text);
    response.fold(
      (failure) {
        emit(ResetpasswordError(failure));
      },
      (resendCodeResponse) {
        emit(ResendCodeSuccess(resendCodeResponse));
      },
    );
  }

  @override
  Future<void> close() {
    email.dispose();
    code.dispose();
    password.dispose();
    confirmationPassword.dispose();

    return super.close();
  }
}
