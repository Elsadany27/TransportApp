import 'package:flutter/material.dart';

import '../../../../../core/utilities/app_images.dart';

class Appbar extends StatelessWidget {
  const Appbar({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return  Container(
      padding: EdgeInsets.only(top: screenSize.height*0.02,left: screenSize.width*0.02,right: screenSize.width*0.02),
      height:screenSize.height*0.12,
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(screenSize.height*0.15))),
      child: ListTile(
        trailing: CircleAvatar(radius: 25,backgroundImage: AssetImage(Assets.admin),backgroundColor: Colors.white,),
        title: Text("مرحبا يوسف ..👋 ",style: TextStyle(color: Colors.white,fontSize: screenSize.width*0.06,fontWeight: FontWeight.bold),textDirection: TextDirection.rtl,),
        subtitle: Text("اتمنى لك يوما سعيدا ",style: TextStyle(color: Colors.white70,fontSize: screenSize.width*0.04,fontWeight: FontWeight.w500),textDirection: TextDirection.rtl,),
      ),
    );
  }
}
