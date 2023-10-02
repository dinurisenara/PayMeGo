import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRpay extends StatefulWidget {
  const QRpay({super.key});

  @override
  State<QRpay> createState() => _QRpayState();
}

class _QRpayState extends State<QRpay> {
  final qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          buildQrView(context),
          Positioned(
            bottom: 10,
            child: buildResult(),
          ),
        ],
      ),
    );
  }

  Widget buildQrView(BuildContext context) => QRView(
      key: qrKey,
      onQRViewCreated: onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderRadius: 10,
        borderColor: Theme.of(context).colorScheme.primary,
        borderLength: 30,
        borderWidth: 10,
        cutOutSize: 300,
      ));

  void onQRViewCreated(QRViewController p1) {
    setState(() => qrKey.currentContext);
    p1.scannedDataStream.listen((scanData) {
      setState(() {
        qrKey.currentState;
      });
    });
  }

  buildResult() => Container(
      decoration: const BoxDecoration(
        color: Colors.white24,
      ),
      child: const Text(
        'Scan a code',
        style: TextStyle(fontSize: 20),
      ));
}
