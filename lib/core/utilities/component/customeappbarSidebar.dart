import 'package:flutter/material.dart';

import '../app_images.dart';

class CustomeAppbarSidebar extends StatelessWidget {
   CustomeAppbarSidebar({super.key,this.texxt,this.color});

  String? texxt;
  Color? color;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(onPressed: (){Navigator.of(context).pop();}, icon: Icon(color: color,Icons.arrow_back_ios_new_rounded,size: screenSize.height*0.025,)),
        Text("$texxt",style: TextStyle(color: color,fontSize: screenSize.width*0.05,fontWeight: FontWeight.w500),textDirection: TextDirection.rtl,),
        Image.asset(Assets.logo,height: screenSize.height*0.06,),
      ],);
  }
}
