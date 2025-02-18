import 'package:flutter/material.dart';


class ImageWithTextMenu extends StatelessWidget {
  ImageWithTextMenu({super.key, this.image, this.text});

  final String? text;
  final String? image;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(top:screenSize.height*0.010, left:screenSize.width *0.020, right:screenSize.width* 0.010,bottom: screenSize.height*0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text("$text",style: TextStyle(fontWeight: FontWeight.w400,fontSize: screenSize.width*0.04,
            color: Colors.white,
          ),
          ),
          SizedBox(width:screenSize.width* 0.05),
          Image.asset("$image",height: screenSize.height*0.04,color: Colors.white,),

        ],
      ),
    );
  }
}