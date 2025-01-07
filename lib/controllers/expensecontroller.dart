import 'dart:developer';

import 'package:expensetracker/consts/dialogbox.dart';
import 'package:expensetracker/controllers/authCcontroller.dart';
import 'package:expensetracker/main.dart';
import 'package:expensetracker/models/budgetmodel.dart';
import 'package:expensetracker/models/expense_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Expensecontroller extends ChangeNotifier {
  static Expensecontroller instance = Expensecontroller.internal();
  Expensecontroller.internal();
  factory Expensecontroller() => instance;

  List<ExpenseDataModel> expenses = [];
  List<Budgetmodel> budgets = [];

  addExpense({expense, amount}) async {
    await FirebaseFirestore.instance.collection('expenses').add({
      'uid': AuthController().uid,
      'expense': expense,
      'amount': amount,
      'expenseAdded': DateTime.now().millisecondsSinceEpoch,
    });

    notifyListeners();
  }

  fetchExpense() async {
    FirebaseFirestore.instance
        .collection('expenses')
        .where('uid', isEqualTo: AuthController().uid)
        .orderBy('expenseAdded', descending: true)
        .snapshots()
        .listen((snapshot) {
      expenses.clear();
      for (var doc in snapshot.docs) {
        logger.d(doc);
        ExpenseDataModel model = ExpenseDataModel.fromJson(doc.data());

        expenses.add(model);
        log(expenses.toString());
        notifyListeners();
      }
    });
  }

  addbudget({budget}) async {
    await FirebaseFirestore.instance
        .collection('budgets')
        .add({"budget": budget, 'uid': AuthController().uid});
    notifyListeners();
  }

  fetchbudget() {
    FirebaseFirestore.instance
        .collection('budgets')
        .where('uid', isEqualTo: AuthController().uid)
        .snapshots()
        .listen((snapshot) {
      for (var doc in snapshot.docs) {
        logger.d(doc);
        ExpenseDataModel bg = ExpenseDataModel.fromJson(doc.data());
        // budgets.add(bg);
        notifyListeners();
      }
    });
  }
}
