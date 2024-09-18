import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_new/model/user.dart';
import 'package:flutter_riverpod_new/state/user_state.dart';

final userViewModelProvider = NotifierProvider<UserViewModel, UserState>(
  UserViewModel.new,
);

class UserViewModel extends Notifier<UserState> {
  @override
  UserState build() {
    return const UserState(isLoading: true);
  }

  void addUser(User user) {
    state = state.copyWith(isLoading: true, isAdded: false, errorMessage: null);

    final currentState = state.users;

    if (state.errorMessage != null) {
      return;
    }

    state = state.copyWith(
      users: [...currentState, user],
      isLoading: false,
      //errorMessage: "Something went wrong",
      isAdded: true,
    );
  }
}
