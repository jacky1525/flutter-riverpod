import 'package:flutter_riverpod_new/model/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_state.freezed.dart';

@freezed
class UserState with _$UserState {
  const factory UserState({
    @Default([]) List<User> users,
    String? errorMessage,
    @Default(false) bool isLoading,
    @Default(false) bool isAdded,
  }) = _UserState;
}
