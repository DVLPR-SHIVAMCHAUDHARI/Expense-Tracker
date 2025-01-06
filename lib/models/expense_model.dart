class ExpenseDataModel {
  String? amount;
  String? expense;
  int? expenseAdded;
  String? uid;
  int? budget;

  ExpenseDataModel(
      {this.amount, this.expense, this.expenseAdded, this.uid, this.budget});

  // Create an instance from JSON
  factory ExpenseDataModel.fromJson(Map<String, dynamic> json) {
    return ExpenseDataModel(
        amount: json['amount'],
        expense: json['expense'],
        expenseAdded: json['expenseAdded'],
        budget: json['budget'],
        uid: json['uid']);
  }

  // Convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'expense': expense,
      'expenseAdded': expenseAdded,
      'uid': uid,
      'budget': budget
    };
  }
}
