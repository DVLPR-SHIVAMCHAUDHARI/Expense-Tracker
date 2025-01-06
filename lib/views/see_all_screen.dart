import 'package:expensetracker/consts/datetime.dart';
import 'package:expensetracker/controllers/expensecontroller.dart';
import 'package:expensetracker/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SeeAllScreen extends StatelessWidget {
  const SeeAllScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pushReplacementNamed(Routes.home.name);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
            size: 23,
          ),
        ),
        backgroundColor: Colors.blue,
        title: Text(
          "Recent Activity",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Consumer<Expensecontroller>(
          builder: (context, controller, _) {
            return Builder(
              builder: (
                context,
              ) {
                return Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.expenses.length,
                    itemBuilder: (context, index) => Container(
                      margin: EdgeInsets.only(top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                ("${controller.expenses[index].expense}"),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "${dateTime(controller.expenses[index].expenseAdded!)}",
                                style: TextStyle(color: Colors.grey.shade500),
                              ),
                            ],
                          ),
                          Text(
                            "RS ${controller.expenses[index].amount}",
                            style:
                                TextStyle(color: Colors.black, fontSize: 16.sp),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //
                  //
                );
              },
            );
          },
        ),
      ),
    );
  }
}
