import 'dart:io';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';
import 'package:trasportation/core/utilities/app_images.dart';
import 'package:trasportation/features/home/presentation/view/homepage.dart';
import 'package:trasportation/features/login/presentation/view/widgets/contentofpage.dart';


class QrScaanPage extends StatelessWidget {
  QrScaanPage({super.key, this.email, this.pass});

  String? email, pass;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          //container background
          Container(decoration: BoxDecoration(image: DecorationImage(image: AssetImage(Assets.backgroundQR), fit: BoxFit.fill)),),
          //shadow Conrainer
          Container(color: Colors.black54,),
          // Text and button
          ContentOfPage(email: email,password: pass,)

        ],
      ),
    );
  }
}




