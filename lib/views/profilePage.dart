import 'package:expensetracker/consts/assetsurl.dart';
import 'package:expensetracker/consts/typography.dart';
import 'package:expensetracker/controllers/authCcontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class Profilepage extends StatelessWidget {
  const Profilepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 13.h,
            ),
            IconButton(
                onPressed: () {
                  GoRouter.of(context).pop();
                },
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.blue,
                )),
            SizedBox(
              height: 25.h,
            ),
            Container(
              padding: EdgeInsets.only(left: 26, right: 26, top: 15),
              height: 148.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue.shade400,
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    child: Image.asset(Assetsurl.igprofile),
                    radius: 30.r,
                  ),
                  Text(
                    AuthController().name,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: Typo.interbold,
                        fontSize: 20.sp),
                  ),
                  Text(
                    AuthController().uid,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: Typo.interbold,
                        fontSize: 13.sp),
                  ),
                ],
              ),
            ),
            Expanded(
                child: ListView(
              // itemExtent: 5,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 34),
                    child: Row(
                      children: [
                        Container(
                          height: 57.h,
                          width: 53.w,
                          decoration: BoxDecoration(
                              color: Colors.blue.shade300,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(22.r)),
                          child: Icon(
                            Icons.person_outline,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 13.w,
                        ),
                        Text(
                          "Edit Profile",
                          style: TextStyle(
                              fontFamily: Typo.interregular, fontSize: 15.sp),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 34),
                    child: Row(
                      children: [
                        Container(
                          height: 57.h,
                          width: 53.w,
                          decoration: BoxDecoration(
                              color: Colors.blue.shade300,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(22.r)),
                          child: Icon(
                            Icons.security_outlined,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 13.w,
                        ),
                        Text(
                          "Security",
                          style: TextStyle(
                              fontFamily: Typo.interregular, fontSize: 15.sp),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 34),
                    child: Row(
                      children: [
                        Container(
                          height: 57.h,
                          width: 53.w,
                          decoration: BoxDecoration(
                              color: Colors.blue.shade300,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(22.r)),
                          child: Icon(
                            Icons.settings_outlined,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 13.w,
                        ),
                        Text(
                          "Settings",
                          style: TextStyle(
                              fontFamily: Typo.interregular, fontSize: 15.sp),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 34),
                    child: Row(
                      children: [
                        Container(
                          height: 57.h,
                          width: 53.w,
                          decoration: BoxDecoration(
                              color: Colors.blue.shade300,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(22.r)),
                          child: Icon(
                            Icons.support_agent_outlined,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 13.w,
                        ),
                        Text(
                          "Support",
                          style: TextStyle(
                              fontFamily: Typo.interregular, fontSize: 15.sp),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    AuthController().signOut();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 34),
                    child: Row(
                      children: [
                        Container(
                          height: 57.h,
                          width: 53.w,
                          decoration: BoxDecoration(
                              color: Colors.blue.shade300,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(22.r)),
                          child: Icon(
                            Icons.logout_outlined,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 13.w,
                        ),
                        Text(
                          "Logout",
                          style: TextStyle(
                              fontFamily: Typo.interregular, fontSize: 15.sp),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
