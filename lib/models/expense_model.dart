class ExpenseDataModel {
  String? amount;
  String? expense;
  int? expenseAdded;
  String? uid;

  ExpenseDataModel({
    this.amount,
    this.expense,
    this.expenseAdded,
    this.uid,
  });

  // Create an instance from JSON
  factory ExpenseDataModel.fromJson(Map<String, dynamic> json) {
    return ExpenseDataModel(
        amount: json['amount'],
        expense: json['expense'],
        expenseAdded: json['expenseAdded'],
        uid: json['uid']);
  }

  // Convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'expense': expense,
      'expenseAdded': expenseAdded,
      'uid': uid,
    };
  }
}
