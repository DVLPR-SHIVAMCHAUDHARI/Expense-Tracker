import 'package:expensetracker/firebase_options.dart';
import 'package:expensetracker/views/homescreen.dart';
import 'package:expensetracker/views/splashscreen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

enum Routes { splash, home }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(Expense_Tracker());
}

class Expense_Tracker extends StatelessWidget {
  Expense_Tracker({super.key});

  GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        name: Routes.splash.name,
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        path: "/home",
        name: Routes.home.name,
        builder: (context, state) => Homescreen(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(390, 844),
      child: MaterialApp.router(
        routerConfig: router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
