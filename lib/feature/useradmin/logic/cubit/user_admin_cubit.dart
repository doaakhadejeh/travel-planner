import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_planner/feature/useradmin/data/remot/useradminremte.dart';
import 'package:travel_planner/feature/useradmin/logic/cubit/user_admin_state.dart';

class UserAdminCubit extends Cubit<UserAdminState> {
  final UserAdmindata userAdmindata;
  UserAdminCubit(this.userAdmindata) : super(UserAdminInitial());
  Set<int> userBlock = {};

  Future<void> getUserTrip() async {
    emit(UserAdminLoading());
    final response = await userAdmindata.getUserAdmin();
    response.fold(
      (failure) {
        emit(UserAdminError(failure));
      },
      (userAdminResponse) {
        emit(UserAdminSuccess(userAdminResponse));
      },
    );
  }

  void toggleUserBlock(int userId) async {
    if (state is UserAdminSuccess) {
      final currentList = [...(state as UserAdminSuccess).response];
      final index = currentList.indexWhere((e) => e.id == userId);
      if (index == -1) return;
      final isBlock = userBlock.contains(userId);
      if (isBlock) {
        userBlock.remove(userId);
      } else {
        userBlock.add(userId);
      }

      final response = await userAdmindata.toggleBlockUser(userId);
      response.fold((failure) => emit(UserAdminError(failure)), (updatedUser) {
        currentList[index] = updatedUser;
        emit(UserAdminSuccess(currentList));
      });
    }
  }
}
