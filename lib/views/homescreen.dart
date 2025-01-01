import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expensetracker/consts/assetsurl.dart';
import 'package:expensetracker/consts/bottomsheet.dart';
import 'package:expensetracker/consts/collerpallet.dart';
import 'package:expensetracker/consts/datetime.dart';
import 'package:expensetracker/consts/typography.dart';
import 'package:expensetracker/controllers/expensecontroller.dart';
import 'package:expensetracker/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

GlobalKey<FormState> formkey = GlobalKey();

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  void initState() {
    Expensecontroller().fetchExpense();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Expense Tracker",
          style: TextStyle(color: Colors.white),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        shape: const CircleBorder(),
        elevation: 0,
        onPressed: () {
          addExpensesform(context);
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
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
                      color: const Color(0xff8E8E93)),
                ),
                GestureDetector(
                  onTap: () {
                    GoRouter.of(appContext).goNamed(Routes.profile.name);
                  },
                  child: CircleAvatar(
                    radius: 20.r,
                    child: Image.asset(Assetsurl.igprofile),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                " Home",
                style: TextStyle(fontSize: 32.sp, fontFamily: Typo.interbold),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20, top: 15),
              height: 110.h,
              width: 343.w,
              decoration: BoxDecoration(
                color: Colors.blue.shade400,
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Monthly Budget",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: Typo.interregular,
                            fontSize: 15.sp),
                      ),
                      Text(
                        "Rs 25,520",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: Typo.interbold,
                            fontSize: 34.sp),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                      Icons.edit_note_rounded,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            Consumer<Expensecontroller>(builder: (context, controller, _) {
              return Builder(builder: (context) {
                return Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.expenses.length,
                    itemBuilder: (context, index) => ListTile(
                      title: Text("${controller.expenses[index].expense}"),
                      leading: Text("${controller.expenses[index].amount}"),
                      trailing: Text(
                          "${dateTime(controller.expenses[index].expenseAdded!)}"),
                    ),
                  ),
                );
              });
            })
          ],
        ),
      ),
    );
  }
}
