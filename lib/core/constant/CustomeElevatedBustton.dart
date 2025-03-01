import 'package:flutter/material.dart';
import 'package:trasportation/core/utilities/app_color.dart';

class CustomeElevatedBustton extends StatelessWidget {
   CustomeElevatedBustton({super.key,this.textt,required this.ontap,this.color});
   String? textt;
   final VoidCallback ontap;
   Color? color;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return  Padding(
      padding:  EdgeInsets.only(left: screenSize.width*0.06,right: screenSize.width*0.06,top: screenSize.height*0.05),
      child: ElevatedButton(onPressed: ontap, child: Text("$textt",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: screenSize.width*0.04),),style: ElevatedButton.styleFrom(
          backgroundColor: color,
          elevation: 30,
          shadowColor: Colors.white38,
          padding: EdgeInsets.only(top: screenSize.height*0.02,bottom: screenSize.height*0.02),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
      ),),
    );
  }
}
