import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_text_stylesl.dart';
import 'package:payflow/shared/themes/appcolor.dart';
import 'package:payflow/shared/widgets/divider/divider_vertical_widget.dart';
import 'package:payflow/shared/widgets/labelButton/label_button.dart';

class SetLabelButtons extends StatelessWidget {
  final String primaryLabel;
  final VoidCallback primaryOnPressed;
  final String secondaryLabel;
  final VoidCallback secondaryOnPressed;
  final bool enablePrimaryColor;
  final bool secondaryColor;

  const SetLabelButtons(
      {Key? key,
      required this.primaryLabel,
      required this.primaryOnPressed,
      required this.secondaryLabel,
      required this.secondaryOnPressed,
      this.enablePrimaryColor = false,
      this.secondaryColor = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.shape,
        height: 56,
        child: Row(
          children: [
            Expanded(
                child: LabelButton(
              label: primaryLabel,
              onPressed: primaryOnPressed,
              style: enablePrimaryColor ? AppTextStyles.buttonPrimary : null,
            )),
            DividerVerticalWidget(),
            Expanded(
                child: LabelButton(
              label: secondaryLabel,
              onPressed: secondaryOnPressed,
              style: secondaryColor ? AppTextStyles.buttonPrimary : null,
            )),
          ],
        ));
  }
}
