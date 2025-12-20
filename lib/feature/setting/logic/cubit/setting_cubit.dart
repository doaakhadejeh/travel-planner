import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_planner/feature/setting/data/remote/settingremote.dart';
import 'package:travel_planner/feature/setting/logic/cubit/setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  final Settingdata settingdata;
  SettingCubit(this.settingdata) : super(SettingInitial());
}
