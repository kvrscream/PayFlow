import 'package:flutter/material.dart';
import 'package:payflow/shared/models/boleto_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BoletoListController {
  final BoletosNotifier = ValueNotifier<List<BoletoModel>>(<BoletoModel>[]);
  List<BoletoModel> get boletos => BoletosNotifier.value;
  set boletos(List<BoletoModel> value) => BoletosNotifier.value = value;

  BoletoListController() {
    getBoletos();
  }

  Future<void> getBoletos() async {
    try {
      var instance = await SharedPreferences.getInstance();
      final incomes = instance.getStringList("boletos");
      boletos = incomes!.map((e) => BoletoModel.fromJson(e)).toList();
    } catch (e) {
      print("Erro na busca de boletos: " + e.toString());
    }
    return;
  }
}
