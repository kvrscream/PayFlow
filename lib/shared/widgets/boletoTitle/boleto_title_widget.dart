import 'package:flutter/material.dart';
import 'package:payflow/shared/models/boleto_model.dart';
import 'package:payflow/shared/themes/app_text_stylesl.dart';

class BoletoTilteWiget extends StatelessWidget {
  final BoletoModel data;
  const BoletoTilteWiget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        data.name!,
        style: AppTextStyles.titleListTile,
      ),
      subtitle: Text(
        "Vence em ${data.dueDate}",
        style: AppTextStyles.captionBody,
      ),
      trailing: Text.rich(TextSpan(
          text: "R\$",
          style: AppTextStyles.trailingRegular,
          children: [
            TextSpan(
                text: "${data.value!.toStringAsFixed(2)}",
                style: AppTextStyles.trailingBold)
          ])),
    );
  }
}
