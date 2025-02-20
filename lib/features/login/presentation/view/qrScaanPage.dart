import 'dart:io';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';
import 'package:trasportation/core/utilities/app_color.dart';

import 'package:trasportation/core/utilities/app_images.dart';
import 'package:trasportation/features/home/presentation/view/homepage.dart';

class QrScaanPage extends StatefulWidget {
  QrScaanPage({super.key});

  @override
  State<QrScaanPage> createState() => _QrScaanPageState();
}

class _QrScaanPageState extends State<QrScaanPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  String qrCodeResult = "Scan a code";
  bool isScanned = false; // Flag to track if a QR code has been scanned

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller?.pauseCamera();
    }
    controller?.resumeCamera();
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });

    controller.scannedDataStream.listen((scanData) {
      if (!isScanned) {  // Check if a QR code has already been scanned
        setState(() {
          isScanned = true;  // Mark as scanned
          qrCodeResult = scanData.code.toString(); // Store the scanned result
        });
        // print("Scanned QR Code: $qrCodeResult"); // No more console output

        // Pause the camera after scan
        controller.pauseCamera();
        // Show success dialog
        showDialog(
          context: context,
          barrierDismissible: false, // Prevent dismissing by tapping outside
          builder: (BuildContext context) {
            final screenSize = MediaQuery.of(context).size;
            return AlertDialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              title: Text("تمت بنجاح", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: screenSize.width * 0.065),),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.check_circle, color: Colors.green, size: screenSize.height * 0.15),
                  SizedBox(height: screenSize.height * 0.02),
                  Text("لقد قمت بمسح رمز الاستجابة السريعة بنجاح.",textAlign: TextAlign.center, style: TextStyle(fontSize: screenSize.width * 0.04),),
                ],
              ),
              actions: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.12, vertical: screenSize.height * 0.02),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomePage(),), (route) => false,);
                  },
                  child: Text("استمرار", style: TextStyle(fontSize: screenSize.width * 0.04,color: Colors.white)),
                ),
              ],
            );
          },
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Container border
            Container(
              height: screenSize.height * 0.42,
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.yellowAccent),
                color: Color(0xffFAC649),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(screenSize.width * 0.55)),
              ),
            ),
            // Image
            Container(
              height: screenSize.height * 0.41,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(screenSize.width * 0.55)),
                image: DecorationImage(image: AssetImage(Assets.qrimage), fit: BoxFit.fill),
              ),
            ),
            // Text and button
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: screenSize.height * 0.35),
                // Text
                Center(
                  child: Text(
                    "قم بالضغط على QR , لتبدأ رحلتك",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: screenSize.width * 0.05,
                      color: Colors.black,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                ),
                // Button to open scanner
                IconButton(
                  onPressed: () {
                    // Open the QR scanner when the button is clicked
                    Navigator.push(context, MaterialPageRoute(builder: (context) => QRView(
                          key: qrKey,
                          onQRViewCreated: _onQRViewCreated,
                          overlay: QrScannerOverlayShape(
                            borderColor: Colors.blue,
                            borderRadius: 10,
                            borderLength: 30,
                            borderWidth: 10,
                            cutOutSize: screenSize.width * 0.8,
                          ),
                        ),
                      ),
                    );
                  },
                  icon: Icon(Icons.qr_code, size: screenSize.height * 0.15), // QR Button icon
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
