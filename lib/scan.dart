import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class Scan extends StatefulWidget {
  const Scan({super.key});

  @override
  State<Scan> createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  bool _start = false;
  final GlobalKey<State> _qrKey = GlobalKey<State>(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((Barcode scanData) => setState(() => result = scanData));
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 5,
          child:_start ?  QRView(
            key: _qrKey,
            onQRViewCreated: _onQRViewCreated,
          ) : Container(padding: const Ed),
        ),
      ],
    );
  }
}
