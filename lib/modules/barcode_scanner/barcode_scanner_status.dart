import 'package:camera/camera.dart';

class BarcodeScannerStatus {
  final bool isAvailable;
  final String error;
  final String barcode;
  final bool stopScanner;

  BarcodeScannerStatus(
      {this.isAvailable = false,
      this.error = "",
      this.barcode = "",
      this.stopScanner = false});

  factory BarcodeScannerStatus.available() =>
      BarcodeScannerStatus(isAvailable: true, stopScanner: false);

  factory BarcodeScannerStatus.error(String message) => BarcodeScannerStatus(
      isAvailable: false, error: message, stopScanner: true);

  factory BarcodeScannerStatus.barcode(String barcode) => BarcodeScannerStatus(
      isAvailable: false, barcode: barcode, stopScanner: true);

  bool get showCamera => isAvailable && error.isEmpty;
  bool get hasError => error.isNotEmpty;
  bool get hasBarCode => barcode.isNotEmpty;

  BarcodeScannerStatus copyWith({
    bool? isAvailable,
    String? error,
    String? barcode,
    bool? stopScanner,
    CameraController? cameraController,
  }) {
    return BarcodeScannerStatus(
      isAvailable: isAvailable ?? this.isAvailable,
      error: error ?? this.error,
      barcode: barcode ?? this.barcode,
      stopScanner: stopScanner ?? this.stopScanner,
    );
  }
}
