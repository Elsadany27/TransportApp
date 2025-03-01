import 'dart:io';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';
import 'package:trasportation/features/home/presentation/view/homepage.dart';
import '../../../../../core/utilities/app_images.dart';

class ContentOfPage extends StatefulWidget {
  const ContentOfPage({super.key});

  @override
  State<ContentOfPage> createState() => _ContentOfPageState();
}

class _ContentOfPageState extends State<ContentOfPage> {
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

        // Pause the camera after scan
        controller.pauseCamera();

        // Show success dialog
        _showSuccessDialog();
      }
    });
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismissing by tapping outside
      builder: (BuildContext context) {
        final screenSize = MediaQuery.of(context).size;
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: Text("تمت بنجاح", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: screenSize.width * 0.065)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.check_circle, color: Colors.green, size: screenSize.height * 0.15),
              SizedBox(height: screenSize.height * 0.02),
              Text("لقد قمت بمسح رمز الاستجابة السريعة بنجاح.", textAlign: TextAlign.center, style: TextStyle(fontSize: screenSize.width * 0.04)),
            ],
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.12, vertical: screenSize.height * 0.02),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              onPressed: () {
                // Print the QR code result
                print(qrCodeResult);

                // Navigate to HomePage
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => HomePage()),
                      (route) => false,
                );
              },
              child: Text("استمرار", style: TextStyle(fontSize: screenSize.width * 0.04, color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(right: screenSize.width * 0.03, left: screenSize.width * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: screenSize.height * 0.15),
            child: Image.asset(Assets.logo, height: screenSize.height * 0.15),
          ),
          // Text description and button to open scanner
          Container(
            margin: EdgeInsets.only(top: screenSize.height * 0.1),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "قم بالضغط على QR\n لتحصل على مسارك و تبدأ رحلتك",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: screenSize.width * 0.05, color: Colors.white60),
                  textDirection: TextDirection.rtl,
                ),
                // Button to open scanner
                Center(
                  child: IconButton(
                    onPressed: () {
                      // Open the QR scanner when the button is clicked
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QRView(
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
                          ));
                    },
                    icon: Icon(Icons.qr_code, size: screenSize.height * 0.2, color: Colors.white), // QR Button icon
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}