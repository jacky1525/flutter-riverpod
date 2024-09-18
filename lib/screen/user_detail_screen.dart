import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_new/view_model/user_view_model.dart';

class UserDetailScreen extends ConsumerWidget {
  final int index;
  const UserDetailScreen(this.index, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(userViewModelProvider);
    final user = users.users[index];
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Detail Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Username: ${user.username}",
                    style: const TextStyle(
                        fontSize: 36, fontWeight: FontWeight.bold)),
              ),
              Text("Mail: ${user.mail}", style: const TextStyle(fontSize: 25)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Age: ${user.age}",
                    style: const TextStyle(fontSize: 25)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
