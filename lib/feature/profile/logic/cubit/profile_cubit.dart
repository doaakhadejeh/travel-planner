import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_planner/feature/profile/data/remote/profileremote.dart';
import 'package:travel_planner/feature/profile/logic/cubit/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final Profiledata profiledata;
  ProfileCubit(this.profiledata) : super(ProfileInitial());
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController oldPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  final key = GlobalKey<FormState>();

  Future<void> getProfile() async {
    emit(ProfileLoading());
    final response = await profiledata.getprofile();
    response.fold(
      (failure) {
        emit(ProfileError(failure));
      },
      (profileResponse) {
        name.text = profileResponse.name;
        email.text = profileResponse.email;
        phone.text = profileResponse.phoneNumber;
        emit(ProfileSuccess(profileResponse));
      },
    );
  }

  Future<void> updateProfile() async {
    emit(ProfileLoading());
    Map<String, dynamic> data = {};

    if (name.text.isNotEmpty) data['name'] = name.text;
    if (email.text.isNotEmpty) data['email'] = email.text;
    if (phone.text.isNotEmpty) data['phone_number'] = phone.text;
    final response = await profiledata.updateProfile(data);
    response.fold(
      (failure) {
        emit(ProfileError(failure));
      },
      (profileResponse) {
        emit(ProfileUpdateSuccess(profileResponse));
      },
    );
  }

  Future<void> updatePassword() async {
    emit(ProfileLoading());
    final response = await profiledata.changePassword(
      oldPassword.text,
      newPassword.text,
      confirmPassword.text,
    );
    response.fold(
      (failure) {
        emit(ProfileError(failure));
      },
      (_) {
        emit(PasswordChangedSuccess());
      },
    );
  }

  Future<void> profileImage(File image) async {
    emit(ProfileLoading());
    final response = await profiledata.profileImage(image);
    response.fold(
      (failure) {
        emit(ProfileError(failure));
      },
      (profileResponse) {
        emit(ProfileImageUpdated(profileResponse));
      },
    );
  }
}
