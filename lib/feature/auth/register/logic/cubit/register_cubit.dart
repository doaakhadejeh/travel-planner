import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_planner/core/network/api_error_model.dart';
import 'package:travel_planner/feature/auth/register/data/model/registermodel.dart';
import 'package:travel_planner/feature/auth/register/data/remote/registerremote.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final Registerdata registerdata;
  RegisterCubit(this.registerdata) : super(RegisterInitial());
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmationPassword = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();

  final formKey = GlobalKey<FormState>();

  Future<void> register() async {
    emit(RegisterLoading());
    final response = await registerdata.register(
      name.text,
      email.text,
      password.text,
      confirmationPassword.text,
      phoneNumber.text,
    );
    response.fold(
      (failure) {
        emit(RegisterError(failure));
      },
      (registerResponse) {
        emit(RegisterSuccess(registerResponse));
      },
    );
  }

  @override
  Future<void> close() {
    email.dispose();
    name.dispose();
    password.dispose();
    confirmationPassword.dispose();
    phoneNumber.dispose();

    return super.close();
  }
}
