import 'package:flutter/material.dart';
import 'package:payflow/shared/models/boleto_model.dart';
import 'package:payflow/shared/themes/app_text_stylesl.dart';
import 'package:payflow/shared/themes/appcolor.dart';
import 'package:payflow/shared/widgets/BoletoInfo/bolet_info_widget.dart';
import 'package:payflow/shared/widgets/BoletoList/bolet_list_controller.dart';
import 'package:payflow/shared/widgets/BoletoList/boleto_list_widget.dart';

class ExtractPage extends StatefulWidget {
  const ExtractPage({Key? key}) : super(key: key);

  @override
  _ExtractPageState createState() => _ExtractPageState();
}

class _ExtractPageState extends State<ExtractPage> {
  final controller = BoletoListController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(children: [
          Container(
            color: AppColors.primary,
            height: 40,
            width: double.maxFinite,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ValueListenableBuilder<List<BoletoModel>>(
                valueListenable: controller.BoletosNotifier,
                builder: (_, boletos, __) =>
                    BoletoInfoWidget(size: boletos.length)),
          ),
        ]),
        Padding(
          padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
          child: Row(
            children: [
              Text(
                "Meus Extratos",
                style: AppTextStyles.titleBoldHeadingB,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
          child: Divider(
            color: AppColors.stroke,
            thickness: 1,
            height: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: BoletListWiget(controller: controller),
        )
      ],
    );
  }
}
