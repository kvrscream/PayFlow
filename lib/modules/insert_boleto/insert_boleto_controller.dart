import 'package:flutter/material.dart';
import 'package:payflow/shared/models/boleto_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InsertBoletoController {
  final formKey = GlobalKey<FormState>();
  BoletoModel model = BoletoModel();

  String? validateName(String? value) =>
      value?.isEmpty ?? true ? "O nome do boleto não pode ser vazio!" : null;
  String? validateVencimento(String? value) =>
      value?.isEmpty ?? true ? "A data de vencimento não pode ser vazia" : null;
  String? validateValor(double? value) =>
      value == 00 ? "O valor não pode ser vazio!" : null;
  String? validateCodigo(String? value) =>
      value?.isEmpty ?? true ? "O Código não pode ser vazio!" : null;

  void onChange(
      {String? name, String? dueDate, double? value, String? barcode}) {
    model = model.copyWith(
        name: name, dueDate: dueDate, value: value, barcode: barcode);
  }

  Future<void> salvarBoleto() async {
    try {
      final instance = await SharedPreferences.getInstance();
      final boletos = instance.getStringList("boletos") ?? <String>[];
      boletos.add(model.toJson());
      await instance.setStringList("boletos", boletos);
      return;
    } catch (e) {
      print("errro" + e.toString());
    }
  }

  Future<void> cadastrarBoleto() async {
    final form = formKey.currentState;

    if (form!.validate()) {
      return await salvarBoleto();
    }
  }
}
