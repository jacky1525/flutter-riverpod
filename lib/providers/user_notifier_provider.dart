import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final userNotifierProvider = AutoDisposeNotifierProvider<UserNotifier, String>(
  UserNotifier.new,
);

class UserNotifier extends AutoDisposeNotifier<String> {
  @override
  String build() {
    final keepAlive = ref.keepAlive();
    Timer? timer;

    ref.onDispose(() {
      timer?.cancel();
    });

    ref.onCancel(() {
      timer = Timer(const Duration(seconds: 10), () {
        keepAlive.close();
      });
    });

    ref.onResume(() {
      timer?.cancel();
    });

    return "";
  }

  void setName(String name) {
    state = name;
  }
}
