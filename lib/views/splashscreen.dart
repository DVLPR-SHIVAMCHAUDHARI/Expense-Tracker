import 'package:expensetracker/consts/assetsurl.dart';
import 'package:expensetracker/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

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
            ),
            SizedBox(
              height: 250.h,
            ),
            FloatingActionButton(
              onPressed: () {
                GoRouter.of(context).goNamed(Routes.home.name);
              },
            ),
          ],
        ),
      ),
    );
  }
}
