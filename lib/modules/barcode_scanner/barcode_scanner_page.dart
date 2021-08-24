import 'package:flutter/material.dart';
import 'package:payflow/modules/barcode_scanner/barcode_scanner_controller.dart';
import 'package:payflow/modules/barcode_scanner/barcode_scanner_status.dart';
import 'package:payflow/shared/themes/app_text_stylesl.dart';
import 'package:payflow/shared/themes/appcolor.dart';
import 'package:payflow/shared/widgets/bottomSheet/bottom_sheet_widget.dart';
import 'package:payflow/shared/widgets/setLabelButtons/set_label_buttons.dart';

//Tela em landscape
class BarCodeScannerPage extends StatefulWidget {
  const BarCodeScannerPage({Key? key}) : super(key: key);

  @override
  _BarCodeScannerPageState createState() => _BarCodeScannerPageState();
}

class _BarCodeScannerPageState extends State<BarCodeScannerPage> {
  final barcodeController = BarcodeScannerController();

  @override
  void initState() {
    barcodeController.getAvaliableCameras();

    barcodeController.statusNotifier.addListener(() {
      if (barcodeController.status.hasBarCode) {
        Navigator.pushReplacementNamed(context, "/insert_boleto",
            arguments: barcodeController.status.barcode);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    barcodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return BottomSheetWidget(
    //   title: "Não foi possível identificar um código de barras.",
    //   subTitle: "Tente escanear novamente ou digite o código do seu boleto.",
    //   primaryLabel: "Escanear novamente",
    //   primaryOnPressed: () {},
    //   secondaryLabel: "Digitar código",
    //   secondaryOnPressed: () {},
    // );
    return SafeArea(
      top: true,
      bottom: true,
      left: true,
      right: true,
      child: Stack(
        children: [
          ValueListenableBuilder<BarcodeScannerStatus>(
              valueListenable: barcodeController.statusNotifier,
              builder: (_, status, __) {
                if (status.showCamera) {
                  return Container(
                    color: Colors.blue,
                    child: barcodeController.cameraController!.buildPreview(),
                  );
                } else {
                  return Container();
                }
              }),
          RotatedBox(
            quarterTurns: 1,
            child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  backgroundColor: Colors.black,
                  centerTitle: true,
                  title: Text(
                    "Escaneie o código de barras do boleto",
                    style: AppTextStyles.buttonBackground,
                  ),
                  leading: BackButton(
                    color: AppColors.background,
                  ),
                ),
                body: Column(
                  children: [
                    Expanded(
                        child: Container(
                      color: Colors.black,
                    )),
                    Expanded(
                        flex: 2,
                        child: Container(
                          color: Colors.transparent,
                        )),
                    Expanded(
                        child: Container(
                      color: Colors.black,
                    ))
                  ],
                ),
                bottomNavigationBar: SetLabelButtons(
                  primaryLabel: "Inserir código do boleto",
                  primaryOnPressed: () {},
                  secondaryLabel: "Adicionar da galeria",
                  secondaryOnPressed: () {},
                )),
          ),
          ValueListenableBuilder<BarcodeScannerStatus>(
              valueListenable: barcodeController.statusNotifier,
              builder: (_, status, __) {
                if (status.hasError) {
                  return BottomSheetWidget(
                    title: "Não foi possível identificar um código de barras.",
                    subTitle:
                        "Tente escanear novamente ou digite o código do seu boleto.",
                    primaryLabel: "Escanear novamente",
                    primaryOnPressed: () {
                      barcodeController.scanWithCamera();
                    },
                    secondaryLabel: "Digitar código",
                    secondaryOnPressed: () {
                      Navigator.pushNamed(context, "/insert_boleto");
                    },
                  );
                } else {
                  return Container();
                }
              }),
        ],
      ),
    );
  }
}
