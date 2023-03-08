import 'package:flutter/material.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanBottom extends StatelessWidget {
  const ScanBottom({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 10,
      child: const Icon(Icons.qr_code_rounded),
      onPressed: () async {
        // String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        //   '#FF0C00', 
        //   'CANCELAR', 
        //   false, 
        //   ScanMode.QR
        // );
        final barcodeScanRes = 'https://fernando-herrera.com';
        print(barcodeScanRes);
      },
    );
  }
}