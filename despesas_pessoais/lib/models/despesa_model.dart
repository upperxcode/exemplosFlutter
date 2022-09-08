class DespesaModel {
  int? id;
  String? title;
  double? value;
  DateTime? date;

  DespesaModel();

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      //'id': id,
      'title': title,
      'value': value,
      'date': date,
    };
    return map;
  }

  DespesaModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
    value = map['value'];
    date = map['date'];
  }
}
