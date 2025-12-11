import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_planner/core/network/api_error_model.dart';
import 'package:travel_planner/feature/auth/forgetpassword/data/model/forgetpasswordmodel.dart';
import 'package:travel_planner/feature/auth/forgetpassword/data/remote/forgetpassremote.dart';

part 'forgetpassword_state.dart';

class ForgetpasswordCubit extends Cubit<ForgetpasswordState> {
  final Forgetpassdata forgetpassdata;
  ForgetpasswordCubit(this.forgetpassdata) : super(ForgetpasswordInitial());
  TextEditingController email = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> forgetpassword() async {
    emit(ForgetpasswordLoading());
    final response = await forgetpassdata.forgetPassword(email.text);
    response.fold(
      (failure) {
        emit(ForgetpasswordError(failure));
      },
      (forgetPasswordResponse) {
        emit(ForgetpasswordSuccess(forgetPasswordResponse));
      },
    );
  }

  @override
  Future<void> close() {
    email.dispose();
    return super.close();
  }
}
