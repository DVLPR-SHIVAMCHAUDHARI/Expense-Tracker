import 'package:expensetracker/views/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

addExpensesform(context) {
  TextEditingController _amountField = TextEditingController();
  TextEditingController _expenseField = TextEditingController();

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
              Divider(),
              SizedBox(
                height: 16.h,
              ),
              TextField(
                controller: _expenseField,
                decoration: InputDecoration(labelText: 'Expense name'),
              ),
              TextField(
                controller: _amountField,
                decoration: InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 10.h,
              ),
              FilledButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                },
                child: Text("Add Expense"),
                style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.blue)),
              ),
              SizedBox(
                height: 10.h,
              )
            ],
          ),
        ),
      ),
    ),
  );
}
