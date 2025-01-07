class Budgetmodel {
  String? uid;
  String? budget;

  Budgetmodel({this.uid, this.budget});

  Budgetmodel.fromJson(Map<String, dynamic> json) {
    if (json["uid"] is String) {
      uid = json["uid"];
    }
    if (json["budget"] is String) {
      budget = json["budget"];
    }
  }

  static List<Budgetmodel> fromList(List<Map<String, dynamic>> list) {
    return list.map(Budgetmodel.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["uid"] = uid;
    _data["budget"] = budget;
    return _data;
  }
}
