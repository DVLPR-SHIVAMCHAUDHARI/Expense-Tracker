class ExpenseDataModel {
  String? amount;
  String? expense;
  int? expenseAdded;
  String? uid;
  String? docid;

  ExpenseDataModel(
      {this.amount, this.expense, this.expenseAdded, this.uid, this.docid});

  // Create an instance from JSON
  factory ExpenseDataModel.fromJson(Map<String, dynamic> json, docid) {
    return ExpenseDataModel(
        amount: json['amount'],
        expense: json['expense'],
        expenseAdded: json['expenseAdded'],
        uid: json['uid'],
        docid: docid);
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
