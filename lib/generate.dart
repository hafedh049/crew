import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class Generate extends StatefulWidget {
  const Generate({super.key});

  @override
  State<Generate> createState() => _GenerateState();
}

class _GenerateState extends State<Generate> {
  final QrImage _qrImage = QrImage(
    QrCode(8, QrErrorCorrectLevel.H)..addData("Hafedh"),
  );
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        PrettyQrView(qrImage: _qrImage),
      ],
    );
  }
}
