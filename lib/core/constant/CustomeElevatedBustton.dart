import 'package:flutter/material.dart';

class CustomeElevatedBustton extends StatelessWidget {
   CustomeElevatedBustton({super.key,this.textt,required this.ontap});
   String? textt;
   final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return  Padding(
      padding:  EdgeInsets.only(left: screenSize.width*0.06,right: screenSize.width*0.06,top: screenSize.height*0.05),
      child: ElevatedButton(onPressed: ontap, child: Text("$textt",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          elevation: 30,
          shadowColor: Colors.black,
          padding: EdgeInsets.only(top: screenSize.height*0.02,bottom: screenSize.height*0.02),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
      ),),
    );
  }
}
