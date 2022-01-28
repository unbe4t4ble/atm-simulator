import 'package:atm_simulator/feature/atm/domain/entities/atm.dart';
import 'dart:convert';

List<AtmModel> atmModelDataFromJsonArray(String str) {
  List<dynamic> list = [];
  try {
    list = jsonDecode(str);
  } on FormatException catch (_) {
    print('The provided string is not valid JSON');
    return [];
  }

  List<AtmModel> atmModelDataList = [];

  for (int i = 0; i < list.length; i++) {
    AtmModel atmModelData = AtmModel.fromMap(list[i]);
    atmModelDataList.add(atmModelData);
  }

  return atmModelDataList;
}

String atmModelDataToJsonArray(List<AtmModel> data) {
    List<String> dataString = [];
    data.forEach((element) {
      final dyn = element.toMap();
      dataString.add(json.encode(dyn));
    });
    return dataString.toString();
  }

class AtmModel extends Atm {

  final String name;
  final int amount;

  AtmModel({
    required this.name,
    required this.amount,
  }) : super (name: name, amount: amount);

  factory AtmModel.fromMap(Map<String, dynamic> json) =>
    new AtmModel(
      name: json["name"],
      amount: json["amount"],
    );

  Map<String, dynamic> toMap() => {
      "name": name,
      "amount": amount,
    };

  

}