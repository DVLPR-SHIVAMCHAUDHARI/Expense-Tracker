import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expensetracker/consts/snackbar.dart';
import 'package:expensetracker/main.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

class AuthController extends ChangeNotifier {
  static AuthController instance = AuthController.internal();
  AuthController.internal();
  factory AuthController() => instance;

  get uid => FirebaseAuth.instance.currentUser!.uid;
  get email => FirebaseAuth.instance.currentUser!.email;
  get name => FirebaseAuth.instance.currentUser!.displayName;
  get isLogin => FirebaseAuth.instance.currentUser != null;

  bool isLoading = false;
  set loading(value) {
    isLoading = value;
    notifyListeners();
  }

  signUp({name, email, password}) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      storeUserData(
          name: name, email: email, password: password); //storing data in db
      FirebaseAuth.instance.currentUser!.updateDisplayName(name); //setting
      FirebaseAuth.instance.currentUser!.sendEmailVerification;
      displaySnackbar("User Sign Up Successfully", color: Colors.green);
      GoRouter.of(appContext)
          .goNamed(Routes.home.name); //navigating to homescreen
    } on FirebaseAuthException catch (e) {
      logger.e(e.code);
      displaySnackbar(e.code);
    }
  }

  signIn({email, password}) async {
    loading = true;
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      displaySnackbar("User Sign In Successfully", color: Colors.green);
      GoRouter.of(appContext).goNamed(Routes.home.name);
    } on FirebaseAuthException catch (e) {
      logger.e(e.code);
      Fluttertoast.showToast(msg: e.code);
      // displaySnackbar(e.code);
    }
    loading = false;
  }

  signOut() async {
    await FirebaseAuth.instance.signOut();
    GoRouter.of(appContext).goNamed(Routes.login.name);
  }

  forgetPassword(email) {
    FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    displaySnackbar("We have send reset password email to your register email");
  }

  storeUserData({name, email, password}) async {
    // dbCollections.user.doc()
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .set({'name': name, 'email': email, 'password': password});
  }
}
