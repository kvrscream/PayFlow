import 'package:flutter/material.dart';
import 'package:payflow/modules/insert_boleto/insert_boleto_controller.dart';
import 'package:payflow/shared/themes/app_text_stylesl.dart';
import 'package:payflow/shared/themes/appcolor.dart';
import 'package:payflow/shared/widgets/Input_text_widget/input_text_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payflow/shared/widgets/setLabelButtons/set_label_buttons.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class InsertBoletoPage extends StatefulWidget {
  final String? barcode;
  const InsertBoletoPage({Key? key, this.barcode}) : super(key: key);

  @override
  _InsertBoletoPageState createState() => _InsertBoletoPageState();
}

class _InsertBoletoPageState extends State<InsertBoletoPage> {
  final controller = InsertBoletoController();

  final moneyInputText =
      MoneyMaskedTextController(leftSymbol: "R\$ 0,00", decimalSeparator: ",");
  final dueDateInputText = MaskedTextController(mask: "00/00/0000");
  final barcodeInputText = TextEditingController();

  @override
  void initState() {
    if (widget.barcode != null) {
      barcodeInputText.text = widget.barcode!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: BackButton(
          color: AppColors.Input,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 93),
                child: Text("Preencha os dados do boleto",
                    style: AppTextStyles.titleBoldHeadingB,
                    textAlign: TextAlign.center),
              ),
              Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      InputTextWidget(
                        label: "Nome do Boleto",
                        icon: Icons.description,
                        onChanged: (value) {
                          controller.onChange(name: value);
                        },
                        validator: controller.validateName,
                      ),
                      InputTextWidget(
                          controller: dueDateInputText,
                          label: "Vencimento",
                          icon: FontAwesomeIcons.timesCircle,
                          onChanged: (value) {
                            controller.onChange(dueDate: value);
                          },
                          validator: controller.validateVencimento),
                      InputTextWidget(
                        controller: moneyInputText,
                        label: "Valor",
                        icon: FontAwesomeIcons.wallet,
                        onChanged: (value) {
                          controller.onChange(
                              value: moneyInputText.numberValue);
                        },
                        validator: (_) => controller
                            .validateValor(moneyInputText.numberValue),
                      ),
                      InputTextWidget(
                        controller: barcodeInputText,
                        label: "Código",
                        icon: FontAwesomeIcons.barcode,
                        onChanged: (value) {
                          controller.onChange(barcode: value);
                        },
                        validator: controller.validateCodigo,
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Divider(
              thickness: 1,
              height: 1,
              color: AppColors.stroke,
            ),
            SetLabelButtons(
              primaryLabel: "Cancelar",
              primaryOnPressed: () {
                Navigator.pop(context);
              },
              secondaryLabel: "Cadastrar",
              secondaryOnPressed: () async {
                await controller.cadastrarBoleto();
                Navigator.pop(context);
              },
              secondaryColor: true,
            ),
          ],
        ),
      ),
    );
  }
}
