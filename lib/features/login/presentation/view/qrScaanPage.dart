import 'dart:io';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';
import 'package:trasportation/core/utilities/app_images.dart';
import 'package:trasportation/features/home/presentation/view/homepage.dart';
import 'package:trasportation/features/login/presentation/view/widgets/contentofpage.dart';


class QrScaanPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          //container background
          Container(
            decoration: BoxDecoration(image: DecorationImage(image: AssetImage(Assets.backgroundQR),fit: BoxFit.fill)),
          ),
          //shadow Conrainer
          Container(color: Colors.black54,),

          // Container border
          // Container(
          //   height: screenSize.height * 0.42,
          //   decoration: BoxDecoration(
          //     border: Border.all(width: 2, color: Colors.yellowAccent),
          //     color: Color(0xffFAC649),
          //     borderRadius: BorderRadius.only(bottomLeft: Radius.circular(screenSize.width * 0.55)),
          //   ),
          // ),
          // Image
          // Container(
          //   height: screenSize.height * 0.41,
          //   decoration: BoxDecoration(
          //     color: Colors.red,
          //     borderRadius: BorderRadius.only(bottomLeft: Radius.circular(screenSize.width * 0.55)),
          //     image: DecorationImage(image: AssetImage(Assets.qrimage), fit: BoxFit.fill),
          //   ),
          // ),

          // Text and button
          ContentOfPage()

        ],
      ),
    );
  }
}
