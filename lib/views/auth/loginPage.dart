import 'package:expensetracker/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextButton(
              onPressed: () {
                GoRouter.of(context).goNamed(Routes.home.name);
              },
              child: Text("Login"))
        ],
      ),
    );
  }
}
