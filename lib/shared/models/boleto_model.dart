import 'dart:convert';

class BoletoModel {
  final String? name;
  final String? dueDate;
  final double? value;
  final String? barcode;

  BoletoModel({this.name, this.dueDate, this.value, this.barcode});

  Map<String, dynamic> toMap() =>
      {"name": name, "dueDate": dueDate, "value": value, "barcode": barcode};

  String toJson() => jsonEncode(toMap());

  factory BoletoModel.fromMap(Map<String, dynamic> map) {
    print("map " + map.toString());
    return BoletoModel(
        name: map["name"],
        dueDate: map["dueDate"],
        value: map["value"],
        barcode: map["barcode"]);
  }

  factory BoletoModel.fromJson(String json) =>
      BoletoModel.fromMap(jsonDecode(json));

  BoletoModel copyWith({name, dueDate, value, barcode}) {
    return BoletoModel(
        name: name ?? this.name,
        dueDate: dueDate ?? this.dueDate,
        value: value ?? this.value,
        barcode: barcode ?? this.barcode);
  }
}
