import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_new/screen/add_user_screen.dart';
import 'package:flutter_riverpod_new/screen/user_detail_screen.dart';
import 'package:flutter_riverpod_new/view_model/user_view_model.dart';

class UserListScreen extends ConsumerStatefulWidget {
  const UserListScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserListScreenState();
}

class _UserListScreenState extends ConsumerState<UserListScreen> {
  @override
  Widget build(BuildContext context) {
    final users =
        ref.watch(userViewModelProvider.select((state) => state.users));
    return Scaffold(
      appBar: AppBar(
        title: const Text("User List Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomScrollView(slivers: [
          SliverFillRemaining(
            child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final data = users[index];
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => UserDetailScreen(index)));
                    },
                    child: ListTile(
                      title: Text(data.username),
                      subtitle: Text(data.mail),
                      trailing: const Icon(Icons.person),
                    ),
                  );
                }),
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const AddUserScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
