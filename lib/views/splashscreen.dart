import 'package:expensetracker/consts/assetsurl.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              child: Image.asset(Assetsurl.igsplashimg),
            )
          ],
        ),
      ),
    );
  }
}
