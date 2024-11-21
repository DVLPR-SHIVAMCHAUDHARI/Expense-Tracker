import 'dart:math';

import 'package:expensetracker/consts/assetsurl.dart';
import 'package:expensetracker/consts/bottomsheet.dart';
import 'package:expensetracker/consts/collerpallet.dart';
import 'package:expensetracker/consts/typography.dart';
import 'package:expensetracker/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

GlobalKey<FormState> formkey = GlobalKey();

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Expense Tracker",
          style: TextStyle(color: Colors.white),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        shape: CircleBorder(),
        elevation: 0,
        onPressed: () {
          addExpensesform(context);
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 14.h,
            ),
            //profile

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  " Hello, Shreya",
                  style: TextStyle(
                      fontFamily: Typo.interregular,
                      fontSize: 17.sp,
                      color: Color(0xff8E8E93)),
                ),
                CircleAvatar(
                  radius: 20.r,
                  child: Image.asset(Assetsurl.igprofile),
                )
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              " Home",
              style: TextStyle(fontSize: 32.sp, fontFamily: Typo.interbold),
            ),
            SizedBox(
              height: 16.h,
            ),
            // ListView.builder(
            //   // itemCount: expenses.length,
            //   itemBuilder: (context, index) {
            //     final expense = expenses[index];
            //     return ListTile()
            //   },
            // )
          ],
        ),
      ),
    );
  }
}
