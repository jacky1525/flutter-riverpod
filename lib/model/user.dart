import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    @Default(0) int id,
    @Default("") String username,
    @Default(0) int age,
    @Default("") String mail,
  }) = _User;
}
