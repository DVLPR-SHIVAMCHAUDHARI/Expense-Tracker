import 'package:expensetracker/controllers/expensecontroller.dart';
import 'package:expensetracker/views/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

addExpensesform(context) {
  TextEditingController amountField = TextEditingController();
  TextEditingController expenseField = TextEditingController();

  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) => Container(
      padding: EdgeInsets.only(
          top: 16,
          right: 16,
          left: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom + 16),
      child: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Text(
                'Add new Expense',
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 6.h,
              ),
              const Divider(),
              SizedBox(
                height: 16.h,
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "This field is required.";
                  }
                  return null;
                },
                controller: expenseField,
                decoration: const InputDecoration(labelText: 'Expense name'),
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "This field is required.";
                  }
                  if (double.tryParse(value) == null) {
                    return "Please enter a valid number.";
                  }
                  return null;
                },
                controller: amountField,
                decoration: const InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 10.h,
              ),
              FilledButton(
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    Expensecontroller().addExpense(
                        expense: expenseField.text, amount: amountField.text);
                    GoRouter.of(context).pop();
                    // Form is valid
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Expense Added")),
                    );
                  }
                  FocusScope.of(context).unfocus();
                },
                style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.blue)),
                child: Text("Add Expense"),
              ),
              SizedBox(
                height: 10.h,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
