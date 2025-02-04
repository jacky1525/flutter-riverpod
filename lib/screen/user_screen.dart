import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_new/providers/user_notifier_provider.dart';
import 'package:flutter_riverpod_new/view_model/user_view_model.dart';

class UserScreen extends ConsumerStatefulWidget {
  const UserScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserScreenState();
}

class _UserScreenState extends ConsumerState<UserScreen> {
  late TextEditingController _userController;

  @override
  void initState() {
    super.initState();
    _userController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userNotifierProvider);
    final users = ref.watch(userViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Row(
                children: [
                  Flexible(
                      flex: 2,
                      child: TextFormField(
                        controller: _userController,
                        textInputAction: TextInputAction.done,
                        decoration: const InputDecoration(
                          labelText: "Username",
                          border: OutlineInputBorder(),
                        ),
                      )),
                  const SizedBox(
                    width: 8,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        ref.read(userNotifierProvider.notifier).setName(
                              _userController.text,
                            );
                        _userController.clear();
                      },
                      style: ButtonStyle(
                          side: WidgetStateProperty.all(
                        const BorderSide(color: Colors.black),
                      )),
                      child: const Text(
                        "Add User",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Text("User : $user"),
            )
          ],
        ),
      ),
    );
  }
}
