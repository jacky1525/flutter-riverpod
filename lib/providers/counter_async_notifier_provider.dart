import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterAsyncNotifierProvider =
    AsyncNotifierProvider<CounterAsyncNotifier, int>(CounterAsyncNotifier.new);

class CounterAsyncNotifier extends AsyncNotifier<int> {
  @override
  FutureOr<int> build() async {
    return 0;
  }

  // fetchData() methodu, state'i loading yapıyoruz.

  Future<void> fetchData() async {
    state = const AsyncValue.loading();

    try {
      final value = await Future.delayed(const Duration(seconds: 5), () => 10);

      state = AsyncValue.data(value);
    } catch (e) {
      state = AsyncValue.error(e.toString(), StackTrace.current);
    }
  }

  // increment() methodu, state'i artırır.

  Future<void> increment() async {
    state = const AsyncValue.loading();

    try {
      final value =
          await Future.delayed(const Duration(seconds: 1), () => state.value) ??
              0;

      state = AsyncValue.data(value + 1);
    } catch (e) {
      state = AsyncValue.error(e.toString(), StackTrace.current);
    }
  }

  // decrement() methodu, state'i azaltır.

  Future<void> decrement() async {
    if (state.value! > 0) {
      state = const AsyncValue.loading();

      try {
        final value = await Future.delayed(
                const Duration(seconds: 1), () => state.value) ??
            0;

        state = AsyncValue.data(value - 1);
      } catch (e) {
        state = AsyncValue.error(e.toString(), StackTrace.current);
      }
    }
  }

  // reset() methodu, state'i sıfırlar.

  Future<void> reset() async {
    state = const AsyncValue.loading();
    try {
      final value = await Future.delayed(const Duration(seconds: 1), () => 0);

      state = AsyncValue.data(value);
    } catch (e) {
      state = AsyncValue.error(e.toString(), StackTrace.current);
    }
  }
}
