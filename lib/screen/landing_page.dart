import 'package:flutter/material.dart';
import 'package:flutter_riverpod_new/screen/counter_screen.dart';
import 'package:flutter_riverpod_new/screen/user_list_screen.dart';
import 'package:flutter_riverpod_new/screen/user_screen.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.black)),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const CounterScreen()));
                },
                child: const Text(
                  "Counter Screen",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.black)),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const UserListScreen()));
                },
                child: const Text(
                  "User Screen",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
