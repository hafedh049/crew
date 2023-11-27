import 'package:crew/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

class Generate extends StatefulWidget {
  const Generate({super.key});

  @override
  State<Generate> createState() => _GenerateState();
}

class _GenerateState extends State<Generate> {
  final TextEditingController _inputController = TextEditingController();
  final GlobalKey<State> _qrKey = GlobalKey<>()

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
            borderRadius: BorderRadius.circular(5),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(color: grey, boxShadow: <BoxShadow>[BoxShadow(color: pink, blurStyle: BlurStyle.outer, offset: Offset(5, 5))]),
              child: TextField(
                controller: _inputController,
                decoration: const InputDecoration(border: InputBorder.none),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: StatefulBuilder(
              _qrKey,
              builder: (context, snapshot) {
                return SfBarcodeGenerator(
                  value: _inputController.text.trim(),
                  barColor: pink,
                  showValue: true,
                  symbology: QRCode(),
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}
