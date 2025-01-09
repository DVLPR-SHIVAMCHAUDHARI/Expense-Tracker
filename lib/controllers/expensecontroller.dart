import 'dart:developer';
import 'package:expensetracker/controllers/authCcontroller.dart';
import 'package:expensetracker/main.dart';
import 'package:expensetracker/models/budgetmodel.dart';
import 'package:expensetracker/models/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Expensecontroller extends ChangeNotifier {
  static Expensecontroller instance = Expensecontroller.internal();
  Expensecontroller.internal();
  factory Expensecontroller() => instance;

  List<ExpenseDataModel> expenses = [];
  List<Budgetmodel> budgets = [];

  get isBudgetLoading => null;

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
        logger.d(doc.data());
        ExpenseDataModel model = ExpenseDataModel.fromJson(doc.data(), doc.id);

        expenses.add(model);

        notifyListeners();
      }
    });
  }

  // addbudget({required double budget}) async {
  //   await FirebaseFirestore.instance.collection('budgets').add({
  //     "budget": budget,
  //     'uid': AuthController().uid,
  //   });
  //   notifyListeners(); // Notify listeners to update the UI
  // }

  addbudget({budget}) async {
    await FirebaseFirestore.instance
        .collection('budgets')
        .where('uid', isEqualTo: AuthController().uid)
        .get()
        .then((snapshot) {
      for (var doc in snapshot.docs) {
        doc.reference.delete();
      }
    });
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
      budgets.clear();
      for (var doc in snapshot.docs) {
        Budgetmodel bg = Budgetmodel.fromJson(doc.data());
        budgets.add(bg);
      }

      notifyListeners();
    });
  }

  deleteExpense(index) {
    if (index >= 0 && index < expenses.length) {
      var expToBeDeleted = expenses[index];
      expenses.removeAt(index);
      FirebaseFirestore.instance
          .collection('expenses')
          .doc(expToBeDeleted.docid)
          .delete();
      notifyListeners();
    }
  }
}
