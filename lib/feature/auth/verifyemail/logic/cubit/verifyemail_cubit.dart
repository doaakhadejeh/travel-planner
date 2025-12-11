import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_planner/core/network/api_error_model.dart';
import 'package:travel_planner/feature/auth/resetpassword/data/model/resendverifycodemodel.dart';
import 'package:travel_planner/feature/auth/verifyemail/data/model/verifyemailmodel.dart';
import 'package:travel_planner/feature/auth/verifyemail/data/remote/verifyemailremote.dart';

part 'verifyemail_state.dart';

class VerifyemailCubit extends Cubit<VerifyemailState> {
  final Verifyemaildata verifyemaildata;
  VerifyemailCubit(this.verifyemaildata) : super(VerifyemailInitial());

  TextEditingController email = TextEditingController();
  TextEditingController code = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> verifyemail() async {
    emit(VerifyemailLoading());
    final response = await verifyemaildata.verifyEmail(email.text, code.text);
    response.fold(
      (failure) {
        emit(VerifyemailError(failure));
      },
      (verifyEmailResponse) {
        emit(VerifyemailSuccess(verifyEmailResponse));
      },
    );
  }

  Future<void> resendverifycode() async {
    emit(VerifyemailLoading());
    final response = await verifyemaildata.resendVerifyCode(email.text);
    response.fold(
      (failure) {
        emit(VerifyemailError(failure));
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
    return super.close();
  }
}
