import 'package:flutter/material.dart';


class CustomeCircleAvatar extends StatelessWidget {
  CustomeCircleAvatar({super.key,this.image});
  String? image;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return  Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width:screenSize.width *0.006,color: Colors.orange)
      ),
      child: CircleAvatar(
        radius: 30,
        backgroundImage: AssetImage("$image"),
      ),
    );
  }
}
