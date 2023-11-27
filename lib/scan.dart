import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class Scan extends StatefulWidget {
  const Scan({super.key});

  @override
  State<Scan> createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  final QrImage _qrImage = QrImage(
    QrCode(8, QrErrorCorrectLevel.H)..addData("Hafedh"),
  );
  @override
  Widget build(BuildContext context) {
    return Center(child: PrettyQrView(qrImage: _qrImage));
  }
}
