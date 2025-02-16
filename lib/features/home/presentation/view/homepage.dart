import 'package:flutter/material.dart';
import 'package:trasportation/core/utilities/app_images.dart';
import 'package:trasportation/features/home/presentation/view/widgets/appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: screenSize.height*0.12),
            child: Column(children: [
                Text("suiiiii",style: TextStyle(color: Colors.black),)
            ],),
          ),
          //welcome container
          Appbar(),
        ],),
      ),
    );
  }
}
