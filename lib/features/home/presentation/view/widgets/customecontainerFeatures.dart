import 'package:flutter/material.dart';

import '../../../../../core/utilities/app_images.dart';
import '../../../data/data.dart';

class CustomeContainerFeatures extends StatelessWidget {
   CustomeContainerFeatures({super.key});
   List<Data> data=[
     Data(title: "المرتب",image: Assets.money),
     Data(title: "تواريخ الرحلات",image: Assets.date),
   ];
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return   Container(
      margin: EdgeInsets.only(top: screenSize.height*0.04),
      padding: EdgeInsets.only(left: screenSize.width*0.03,right: screenSize.width*0.03),
      height: screenSize.height*0.15,
      child: GridView.builder(itemCount: data.length,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,childAspectRatio: 1.6,mainAxisSpacing:0.1 ,crossAxisSpacing:1.6 ),
        itemBuilder: (context, index) => Card(
          color: Colors.white,
          elevation: 25,
          shadowColor: Colors.black,
          shape: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide(color: Colors.white)),
          child: Padding(
            padding:  EdgeInsets.only(top: screenSize.height*0.015),
            child: Column(children: [
              Text("${data[index].title}",style: TextStyle(fontSize: screenSize.width*0.05,fontWeight: FontWeight.w400),),
              Image.asset("${data[index].image}",height: screenSize.height*0.065,)
            ],),
          ),
        ),),
    );
  }
}
