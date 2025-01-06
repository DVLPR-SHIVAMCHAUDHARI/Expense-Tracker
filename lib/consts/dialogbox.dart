import 'package:expensetracker/consts/customtextfield.dart';
import 'package:expensetracker/controllers/authCcontroller.dart';
import 'package:expensetracker/controllers/expensecontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextEditingController budgetfield = TextEditingController();

budgeteditingdialog(context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Center(
        child: Text(
          "Add Monthly Budget",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      actions: [
        customTextFiled(
          controller: budgetfield,
          hinttext: '₹0000',
          obs: false,
          required: true,
        ),
        Center(
            child: TextButton(
                onPressed: () {
                  Expensecontroller().addbudget(budget: budgetfield.text);

                  Navigator.of(context).pop();
                },
                child: Text("Submit")))
      ],
    ),
  );
}
