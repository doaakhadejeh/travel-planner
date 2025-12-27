import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_planner/core/helper/sharedpref_helper.dart';
import 'package:travel_planner/feature/userpreferences/data/remote/Userpreferencesremote.dart';
import 'package:travel_planner/feature/userpreferences/logic/cubit/userpreferences_state.dart';

class UserpreferencesCubit extends Cubit<UserpreferencesState> {
  final Userpreferencesdata userpreferencesdata;
  UserpreferencesCubit(this.userpreferencesdata)
    : super(UserpreferencesInitial());
  TextEditingController travelStyle = TextEditingController();
  TextEditingController preferredBudgetMin = TextEditingController();
  TextEditingController preferredBudgetMax = TextEditingController();
  TextEditingController preferredCountries = TextEditingController();
  TextEditingController preferredFood = TextEditingController();
  TextEditingController interests = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> getPreferences() async {
    emit(UserpreferencesLoading());

    final response = await userpreferencesdata.getPreferences();
    response.fold((failure) => emit(UserpreferencesError(failure)), (
      prefsResponse,
    ) {
      if (prefsResponse.isNotEmpty) {
        final firstPref = prefsResponse.first;

        travelStyle.text = firstPref.travelStyle;
        preferredBudgetMin.text = firstPref.preferredBudgetMin.toString();
        preferredBudgetMax.text = firstPref.preferredBudgetMax.toString();
        preferredCountries.text = firstPref.preferredCountries;
        preferredFood.text = firstPref.preferredFood;
        interests.text = firstPref.interests;
      }
      emit(UserpreferencesSuccess(prefsResponse));
    });
  }

  Future<void> addPreference() async {
    final currentState = state as UserpreferencesSuccess;

    final current = currentState.response;
    Map<dynamic, dynamic> data = {
      'travel_style': travelStyle.text,
      'preferred_budget_min': preferredBudgetMin.text,
      'preferred_budget_max': preferredBudgetMax.text,
      'preferred_countries': preferredCountries.text,
      'preferred_food': preferredFood.text,
      'interests': interests.text,
    };

    final response = await userpreferencesdata.addPreference(data);
    response.fold((failure) => emit(UserpreferencesError(failure)), (
      newPrefResponse,
    ) {
      emit(UserpreferencesSuccess([...current, newPrefResponse]));
    });
  }

  Future<void> updatePreference(int id) async {
    final current = [...(state as UserpreferencesSuccess).response];

    final index = current.indexWhere((e) => e.id == id);
    if (index == -1) return;

    Map<dynamic, dynamic> data = {
      'travel_style': travelStyle.text,
      'preferred_budget_min': preferredBudgetMin.text,
      'preferred_budget_max': preferredBudgetMax.text,
      'preferred_countries': preferredCountries.text,
      'preferred_food': preferredFood.text,
      'interests': interests.text,
    };

    final response = await userpreferencesdata.updatePreference(id, data);
    response.fold((failure) => emit(UserpreferencesError(failure)), (updated) {
      current[index] = updated;
      emit(UserpreferencesSaveSuccess(current));
    });
  }

  Future<void> deletePreference(int id) async {
    final current = [...(state as UserpreferencesSuccess).response];

    final response = await userpreferencesdata.deletePreference(id);
    response.fold((failure) => emit(UserpreferencesError(failure)), (_) {
      current.removeWhere((e) => e.id == id);
      emit(UserpreferencesSaveSuccess(current));
    });
  }

  Future<void> saveOrUpdate() async {
    if (!formKey.currentState!.validate()) return;
    final currentState = state;

    if (currentState is UserpreferencesSuccess) {
      if (currentState.response.isEmpty) {
        await addPreference();
        await SharedPrefHelper.setData("hasPreferences", true);
      } else {
        await updatePreference(currentState.response.first.id);
      }
    }
  }

  @override
  Future<void> close() {
    travelStyle.dispose();
    preferredBudgetMax.dispose();
    preferredBudgetMin.dispose();
    preferredCountries.dispose();
    preferredFood.dispose();
    interests.dispose();
    return super.close();
  }
}
