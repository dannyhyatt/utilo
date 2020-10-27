import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

// todo implement a qr code history with sharepreferences

class QRScannerPage extends StatefulWidget {
  @override
  _QRScannerPageState createState() => _QRScannerPageState();
}

class _QRScannerPageState extends State<QRScannerPage> {

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController controller;
  String data = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text('utilo'),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
          )
        )
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: QRView(
                key: qrKey,
                onQRViewCreated: _onCreated,
              )
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FlatButton.icon(
                        onPressed: () {
                          if(controller != null) controller.toggleFlash();
                        },
                        icon: Icon(Icons.flash_on),
                        label: Text('Flash')
                    ),
                    FlatButton.icon(
                        onPressed: () {
                          if(controller != null) controller.flipCamera();
                        },
                        icon: Icon(Icons.switch_camera),
                        label: Text('Flip')
                    ),
                  ],
                ),
                Text('Data: $data'),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _onCreated(QRViewController c) {
    this.controller = c;
    c.scannedDataStream.listen((d) {
      setState(() {
        this.data = d;
      });
    });
  }
}
