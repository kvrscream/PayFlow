import 'package:flutter/material.dart';
import 'package:payflow/shared/models/boleto_model.dart';
import 'package:payflow/shared/widgets/BoletoList/bolet_list_controller.dart';
import 'package:payflow/shared/widgets/boletoTitle/boleto_title_widget.dart';

class BoletListWiget extends StatefulWidget {
  final BoletoListController controller;
  const BoletListWiget({Key? key, required this.controller}) : super(key: key);

  @override
  _BoletListWigetState createState() => _BoletListWigetState();
}

class _BoletListWigetState extends State<BoletListWiget> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<BoletoModel>>(
      valueListenable: widget.controller.BoletosNotifier,
      builder: (_, boletos, __) => Column(
        children: boletos.map((e) => BoletoTilteWiget(data: e)).toList(),
      ),
    );
  }
}
