import 'package:expensetracker/consts/customtextfield.dart';
import 'package:expensetracker/consts/snackbar.dart';
import 'package:expensetracker/controllers/authCcontroller.dart';
import 'package:expensetracker/main.dart';
import 'package:expensetracker/views/auth/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _ispass = false;
  bool ispass = false;
  bool isLoading = false;
  set loading(value) {
    isLoading = value;
    setState(() {});
  }

  final formKey = GlobalKey<FormState>(); //create a global key type form state

  TextEditingController nameFeild = TextEditingController();
  TextEditingController emailFeild = TextEditingController();
  TextEditingController passFeild = TextEditingController();
  TextEditingController cpassFeild = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 140.h,
                ),
                Text(
                  "Sign Up",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 46.h),
                customTextFiled(
                  controller: nameFeild,
                  required: true,
                  hinttext: "Full Name",
                  icon: Icons.person_outline_sharp,
                ),
                SizedBox(
                  height: 40.h,
                ),
                customTextFiled(
                  controller: emailFeild,
                  required: true,
                  hinttext: "Email",
                  icon: Icons.email_outlined,
                ),
                SizedBox(
                  height: 40.h,
                ),
                customTextFiled(
                    controller: passFeild,
                    required: true,
                    obs: _ispass,
                    hinttext: "Password",
                    icon: Icons.lock_outline_rounded,
                    suffixicon: IconButton(
                        onPressed: () {
                          setState(() {
                            ispass = !ispass;
                          });
                        },
                        icon: ispass
                            ? const Icon(
                                Icons.visibility_outlined,
                                color: Colors.grey,
                              )
                            : const Icon(
                                Icons.visibility_off_outlined,
                                color: Colors.grey,
                              ))),
                SizedBox(
                  height: 40.h,
                ),
                customTextFiled(
                    controller: cpassFeild,
                    required: true,
                    obs: _ispass,
                    hinttext: " Confirm Password",
                    icon: Icons.lock_outline_rounded,
                    suffixicon: IconButton(
                        onPressed: () {
                          setState(() {
                            _ispass = !_ispass;
                          });
                        },
                        icon: _ispass
                            ? const Icon(
                                Icons.visibility_outlined,
                                color: Colors.grey,
                              )
                            : const Icon(
                                Icons.visibility_off_outlined,
                                color: Colors.grey,
                              ))),
                SizedBox(
                  height: 95.h,
                ),
                SizedBox(
                  height: 50.h,
                  width: 390.w,
                  child: FilledButton(
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.blue),
                    ),
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        if (passFeild.text == cpassFeild.text) {
                          loading = true;
                          await AuthController().signUp(
                              name: nameFeild.text,
                              email: emailFeild.text,
                              password: passFeild.text);
                          isLoading = false;
                        } else {
                          displaySnackbar("Password Dosen't match");
                        }
                      }
                    },
                    child: isLoading
                        ? const SizedBox(
                            height: 15,
                            width: 15,
                            child: CircularProgressIndicator())
                        : Text(
                            "Sign Up",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold),
                          ),
                  ),
                ),
                SizedBox(
                  height: 90.h,
                ),
                TextButton(
                  onPressed: () {
                    GoRouter.of(context).goNamed(Routes.login.name);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account ?  ",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.normal),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(1)),
                        onPressed: () {
                          GoRouter.of(context).goNamed(Routes.login.name);
                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
