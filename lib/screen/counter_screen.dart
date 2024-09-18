import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_new/providers/counter_async_notifier_provider.dart';

class CounterScreen extends ConsumerStatefulWidget {
  const CounterScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CounterScreenState();
}

class _CounterScreenState extends ConsumerState<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    final counterAsync = ref.watch(counterAsyncNotifierProvider);
    final isLoading = counterAsync.isLoading;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Counter Screen',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.black)),
                onPressed: isLoading
                    ? null
                    : () {
                        ref
                            .read(counterAsyncNotifierProvider.notifier)
                            .fetchData();
                      },
                child: const Text(
                  "Get value from database",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )),
            counterAsync.when(
                data: (data) => Text('$data',
                    style: const TextStyle(color: Colors.black, fontSize: 42)),
                error: (error, stackTrace) => Text('$error'),
                loading: () => const CircularProgressIndicator()),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'reset',
            backgroundColor: Colors.black,
            onPressed: isLoading
                ? null
                : () {
                    ref.read(counterAsyncNotifierProvider.notifier).reset();
                  },
            tooltip: 'Reset',
            child: const Icon(
              Icons.restore,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(
            heroTag: 'increment',
            backgroundColor: Colors.black,
            onPressed: isLoading
                ? null
                : () {
                    ref.read(counterAsyncNotifierProvider.notifier).increment();
                  },
            tooltip: 'Increment',
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(
            heroTag: 'decrement',
            backgroundColor: Colors.black,
            onPressed: isLoading
                ? null
                : () {
                    ref.read(counterAsyncNotifierProvider.notifier).decrement();
                  },
            tooltip: 'Increment',
            child: const Icon(
              Icons.remove,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
