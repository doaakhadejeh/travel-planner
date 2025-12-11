import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_planner/core/helper/sharedpref_helper.dart';
import 'package:travel_planner/core/network/api_error_model.dart';
import 'package:travel_planner/feature/auth/login/data/model/loginmodel.dart';
import 'package:travel_planner/feature/auth/login/data/remote/loginremot.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final Logindata logindata;
  LoginCubit(this.logindata) : super(LoginInitial());
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> login() async {
    emit(LoginLoading());
    final response = await logindata.login(email.text, password.text);
    response.fold(
      (failure) {
        emit(LoginError(failure));
      },
      (loginResponse) async {
        await SharedPrefHelper.setSecuredString(
          "userToken",
          loginResponse.token,
        );
        emit(LoginSuccess(loginResponse));
      },
    );
  }

  @override
  Future<void> close() {
    email.dispose();
    password.dispose();
    return super.close();
  }
}
