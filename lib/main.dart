import 'package:expensetracker/controllers/expensecontroller.dart';
import 'package:expensetracker/firebase_options.dart';
import 'package:expensetracker/views/auth/loginPage.dart';
import 'package:expensetracker/views/homescreen.dart';
import 'package:expensetracker/views/splashscreen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

enum Routes { splash, home, login }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(Expense_Tracker());
}

Logger logger = Logger();

class Expense_Tracker extends StatelessWidget {
  Expense_Tracker({super.key});

  GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        name: Routes.splash.name,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: "/login",
        name: Routes.login.name,
        builder: (context, state) => Loginpage(),
      ),
      GoRoute(
        path: "/home",
        name: Routes.home.name,
        builder: (context, state) => const Homescreen(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      child: MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => Expensecontroller())],
        child: MaterialApp.router(
          routerConfig: router,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
