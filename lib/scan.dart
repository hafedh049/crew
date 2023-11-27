import 'dart:io';

import 'package:crew/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class Scan extends StatefulWidget {
  const Scan({super.key});

  @override
  State<Scan> createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  bool _isOpened = false;
  bool _isBack = false;
  bool _isFlash = false;
  final GlobalKey<State> _qrKey = GlobalKey<State>(debugLabel: 'QR');
  Barcode? _result;
  QRViewController? _controller;

  void _onQRViewCreated(QRViewController controller) {
    _controller = controller;
    controller.scannedDataStream.listen(
      (Barcode scanData) => setState(
        () {
          _result = scanData;
          _isOpened = false;
          _isBack = false;
          _isFlash = false;
        },
      ),
    );
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      _controller!.pauseCamera();
    } else if (Platform.isIOS) {
      _controller!.resumeCamera();
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(child: QRView(key: _qrKey, onQRViewCreated: _onQRViewCreated)),
        Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          runAlignment: WrapAlignment.center,
          runSpacing: 20,
          spacing: 20,
          children: <Widget>[
            InkWell(
              hoverColor: transparent,
              highlightColor: transparent,
              splashColor: transparent,
              onTap: () => setState(() => _isOpened = true),
              child: AnimatedContainer(
                duration: 700.ms,
                margin: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: pink),
                padding: const EdgeInsets.all(8),
                child: Text(_isOpened ? "STOP" : "START", style: const TextStyle(color: grey, fontSize: 16, fontWeight: FontWeight.w500)),
              ),
            ),
            InkWell(
              hoverColor: transparent,
              highlightColor: transparent,
              splashColor: transparent,
              onTap: () async {
                await _controller!.flipCamera();
                setState(() => _isFlash = true);
              },
              child: AnimatedContainer(
                duration: 700.ms,
                margin: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: pink),
                padding: const EdgeInsets.all(8),
                child: Text("LIGHT ${_isFlash ? "OFF" : "ON"}", style: const TextStyle(color: grey, fontSize: 16, fontWeight: FontWeight.w500)),
              ),
            ),
            InkWell(
              hoverColor: transparent,
              highlightColor: transparent,
              splashColor: transparent,
              onTap: () async {
                await _controller!.flipCamera();
                setState(() => _isBack = true);
              },
              child: AnimatedContainer(
                duration: 700.ms,
                margin: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: pink),
                padding: const EdgeInsets.all(8),
                child: Text("CAMERA (${_isBack ? "REAR" : "FRONT"})", style: const TextStyle(color: grey, fontSize: 16, fontWeight: FontWeight.w500)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
