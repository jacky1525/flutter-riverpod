import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_new/model/user.dart';
import 'package:flutter_riverpod_new/providers/user_notifier_provider.dart';
import 'package:flutter_riverpod_new/view_model/user_view_model.dart';

class AddUserScreen extends ConsumerStatefulWidget {
  const AddUserScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends ConsumerState<AddUserScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _emailController;
  late TextEditingController _usernameController;
  late TextEditingController _idController;
  late TextEditingController _ageController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _usernameController = TextEditingController();
    _idController = TextEditingController();
    _ageController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _usernameController.dispose();
    _idController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _listener();
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add User Screen"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(children: [
              TextFormField(
                controller: _idController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Id",
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: _usernameController,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "UserName",
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: _ageController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Age",
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: _emailController,
                textInputAction: TextInputAction.done,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Email",
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                  onPressed: () {
                    _addUser();
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
            ]),
          ),
        ));
  }

  void _addUser() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      final user = User(
        id: int.parse(_idController.text),
        username: _usernameController.text,
        mail: _emailController.text,
        age: int.parse(_ageController.text),
      );

      ref.read(userViewModelProvider.notifier).addUser(user);
    }
  }

  void _listener() {
    ref.listen(userViewModelProvider.select((state) => state.isAdded),
        (previous, next) {
      if (next) {
        Navigator.of(context).pop();
      }
    });

    ref.listen(userViewModelProvider.select((state) => state.errorMessage),
        (previous, next) {
      if (next != null) {
        showDialog(
            context: context,
            builder: (builder) => AlertDialog(
                  title: const Text("Error"),
                  content: Text(next.toString()),
                ));
      }
    });
  }
}
