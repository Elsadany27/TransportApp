import 'package:flutter/material.dart';
import '../../../../../core/utilities/app_images.dart';
import 'ImageWithTextSidebar.dart';
import 'customecircleavatat.dart';

class CustomeSidebar extends StatelessWidget {
  CustomeSidebar({super.key,this.name,this.code});
  String? name,code;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
          children: [
            //bottom element (details of menu)
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(top: screenSize.height * 0.05,left:screenSize.width*0.03 ,right:screenSize.width*0.03 ), // 5% of screen height
              width: double.infinity,
              height: screenSize.height ,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xff081026), Color(0xff1E3B8C), Color(0xff081026)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),child: Column(children: [
              Container(
                margin: EdgeInsets.only(top: screenSize.height*0.050,left: screenSize.width*0.010,bottom: screenSize.height*0.02),
                alignment: Alignment.center,
                height:screenSize.height* 0.110,
                width: screenSize.width,
                decoration: BoxDecoration(
                  border: Border.all(width:screenSize.width*0.001,color: Colors.white),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(100),bottomLeft: Radius.circular(100)),),
                child: ListTile(
                  title:Text("يوسف",style: TextStyle(color: Colors.white,fontSize: screenSize.width*0.035),textDirection: TextDirection.rtl,) ,
                  trailing: CustomeCircleAvatar(image: "${Assets.admin}",),
                  subtitle: Text("24225",style: TextStyle(color: Colors.white60),textDirection: TextDirection.rtl,),
                ),),

              //properties
              //
              ImageWithTextMenu(image: "${Assets.edit}",text: "تغير الصورة",),
              Divider(height: screenSize.height*0.01,color: Colors.white),

              ImageWithTextMenu(image: "${Assets.money}",text: "المرتب",),
              Divider(height: screenSize.height*0.01,color: Colors.white),

              ImageWithTextMenu(image: "${Assets.date}",text: "تواريخ الرحلات",),
              Divider(height: screenSize.height*0.01,color: Colors.white),

              ImageWithTextMenu(image: "${Assets.setting}",text: "الاعدادات",),
              Divider(height: screenSize.height*0.01,color: Colors.white),


            ],),),

            // Row(
            //   crossAxisAlignment: CrossAxisAlignment.end,
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     Image.asset(Assets.logo,height: screenSize.height*0.22,),SizedBox(width: screenSize.width*0.03,),
            //     Container(
            //       alignment: Alignment.topCenter,
            //       padding: EdgeInsets.only(top:screenSize.height*0.1,left: screenSize.width*0.05,right: screenSize.width*0.05 ),
            //       width: screenSize.width*0.17,
            //       height: screenSize.height,
            //       color: Colors.orange,
            //       child:InkWell(
            //           onTap: () =>Navigator.of(context).pop(),
            //           child: Image.asset(Assets.loginimage,)),
            //     ),
            //   ],
            // )
          ]),
    );
  }
}
