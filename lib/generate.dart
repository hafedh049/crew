import 'package:crew/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class Generate extends StatefulWidget {
  const Generate({super.key});

  @override
  State<Generate> createState() => _GenerateState();
}

class _GenerateState extends State<Generate> {
  final QrImage _qrImage = QrImage(QrCode(8, QrErrorCorrectLevel.H));
  final TextEditingController _inputController = TextEditingController();

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 60),
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              decoration: const BoxDecoration(color: grey, boxShadow: <BoxShadow>[BoxShadow(color: teal, blurStyle: BlurStyle.outer)]),
              child: TextField(
                controller: _inputController,
                decoration: const InputDecoration(border: InputBorder.none),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(child: PrettyQrView(qrImage: _qrImage, decoration: const PrettyQrDecoration())),
        ],
      ),
    );
  }
}
