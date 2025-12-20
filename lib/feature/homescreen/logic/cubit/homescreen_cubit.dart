import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_planner/feature/homescreen/data/remote/homescreenremote.dart';
import 'package:travel_planner/feature/homescreen/logic/cubit/homescreen_state.dart';

class HomescreenCubit extends Cubit<HomescreenState> {
  final Homescreendata homescreendata;
  HomescreenCubit(this.homescreendata) : super(HomescreenInitial());

  TextEditingController country = TextEditingController();
  TextEditingController days = TextEditingController();
  TextEditingController budget = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> generateTrip() async {
    emit(HomescreenLoading());
    final response = await homescreendata.generateTrip(
      country.text,
      int.parse(days.text),
      double.parse(budget.text),
    );
    response.fold(
      (failure) {
        emit(HomescreenError(failure));
      },
      (homescreenResponse) {
        emit(HomescreenSuccess(homescreenResponse));
      },
    );
  }

  @override
  Future<void> close() {
    country.dispose();
    days.dispose();
    budget.dispose();
    return super.close();
  }
}
