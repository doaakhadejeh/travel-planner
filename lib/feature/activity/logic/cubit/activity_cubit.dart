import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_planner/feature/activity/data/remote/activityremote.dart';
import 'package:travel_planner/feature/activity/logic/cubit/activity_state.dart';

class ActivityCubit extends Cubit<ActivityState> {
  final Activitydata activitydata;
  ActivityCubit(this.activitydata) : super(ActivityInitial());

  Future<void> getActivity(int dayId) async {
    emit(ActivityLoading());
    final response = await activitydata.getActivity(dayId);
    response.fold(
      (failure) {
        emit(ActivityError(failure));
      },
      (activityResponse) {
        emit(ActivitySuccess(activityResponse));
      },
    );
  }
}
