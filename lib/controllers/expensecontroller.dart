import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Expensecontroller extends ChangeNotifier {
  static Expensecontroller instance = Expensecontroller.internal();
  Expensecontroller.internal();
  factory Expensecontroller() => instance;

  addExpense({expense, amount}) {
    FirebaseFirestore.instance.collection('expenses').add({
      'expense': expense,
      'amount': amount,
      'expenseAdded': DateTime.now().millisecond
    });
  }
}
