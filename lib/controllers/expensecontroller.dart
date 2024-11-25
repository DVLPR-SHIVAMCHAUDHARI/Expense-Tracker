import 'dart:developer';

import 'package:expensetracker/main.dart';
import 'package:expensetracker/models/expense_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Expensecontroller extends ChangeNotifier {
  static Expensecontroller instance = Expensecontroller.internal();
  Expensecontroller.internal();
  factory Expensecontroller() => instance;

  List<Expense> expenses = [];

  addExpense({expense, amount}) async {
    await FirebaseFirestore.instance.collection('expenses').add({
      'expense': expense,
      'amount': amount,
      'expenseAdded': DateTime.now().millisecondsSinceEpoch,
    });
    notifyListeners();
  }

  fetchExpense() async {
    FirebaseFirestore.instance
        .collection('expenses')
        .orderBy('expenseAdded', descending: true)
        .snapshots()
        .listen((snapshot) {
      expenses.clear();
      for (var doc in snapshot.docs) {
        logger.d(doc);
        Expense model = Expense.fromJson(doc.data());

        expenses.add(model);
        log(expenses.toString());
        notifyListeners();
      }
    });
  }
}
