class Expense {
  String? amount;
  String? expense;
  int? expenseAdded;

  Expense({this.amount, this.expense, this.expenseAdded});

  // Create an instance from JSON
  factory Expense.fromJson(Map<String, dynamic> json) {
    return Expense(
      amount: json['amount'],
      expense: json['expense'],
      expenseAdded: json['expenseAdded'],
    );
  }

  // Convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'expense': expense,
      'expenseAdded': expenseAdded,
    };
  }
}
