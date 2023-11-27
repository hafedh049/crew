import 'package:crew/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

class Generate extends StatefulWidget {
  const Generate({super.key});

  @override
  State<Generate> createState() => _GenerateState();
}

class _GenerateState extends State<Generate> {
  final TextEditingController _inputController = TextEditingController();
  final GlobalKey<State> _qrKey = GlobalKey<State>();

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
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(color: grey, boxShadow: <BoxShadow>[BoxShadow(color: pink, blurStyle: BlurStyle.outer, offset: Offset(2, 2))]),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: TextField(
                onChanged: (String text) => _qrKey.currentState!.setState(() {}),
                controller: _inputController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Bootstrap.x_diamond, size: 15, color: pink),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: StatefulBuilder(
              key: _qrKey,
              builder: (BuildContext context, void Function(void Function()) _) {
                return SfBarcodeGenerator(
                  value: _inputController.text.trim(),
                  barColor: pink,
                  symbology: QRCode(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
