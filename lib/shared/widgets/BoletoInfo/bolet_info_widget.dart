import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_images.dart';
import 'package:payflow/shared/themes/app_text_stylesl.dart';
import 'package:payflow/shared/themes/appcolor.dart';

class BoletoInfoWidget extends StatelessWidget {
  final int size;
  const BoletoInfoWidget({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                AppImages.logomini,
                color: AppColors.background,
                height: 34,
                width: 56,
              ),
              Container(
                width: 1,
                height: 32,
                color: AppColors.background,
              ),
              Text.rich(TextSpan(
                  text: "Você tem ",
                  style: AppTextStyles.captionBackground,
                  children: [
                    TextSpan(
                        text: "$size boletos\n",
                        style: AppTextStyles.captionBoldBackground),
                    TextSpan(
                        text: "Cadastrados para pagar",
                        style: AppTextStyles.captionBackground)
                  ]))
            ],
          ),
        ));
  }
}
