import 'package:expensetracker/consts/assetsurl.dart';
import 'package:expensetracker/consts/collerpallet.dart';
import 'package:expensetracker/consts/typography.dart';
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
            SizedBox(
              height: 30.h,
            ),
            Container(
              height: 450.h,
              width: 800.w,
              decoration: BoxDecoration(),
              child: Image.asset(
                Assetsurl.igsplashimg,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              "PENNYWISE",
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: Typo.anuphanregular,
                  fontSize: 20.sp),
            ),
            SizedBox(
              height: 24.h,
            ),
            Text(
              "Going cashless has never been this\n easier with the world’s most leading \n               expense manager.",
              style: TextStyle(
                  color: Appcolor.greyTextColor,
                  fontFamily: Typo.interregular,
                  fontSize: 15.sp),
            ),
            SizedBox(
              height: 60.h,
            ),
            Container(
              width: 330.w,
              height: 65.h,
              decoration: BoxDecoration(
                gradient: Appcolor.bluegradient,
                borderRadius: BorderRadius.circular(14.r),
              ),
              child: TextButton(
                onPressed: () {
                  GoRouter.of(context).goNamed(Routes.home.name);
                },
                child: Text(
                  "Get Started",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: Typo.anuphanregular,
                      fontSize: 20.sp),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
