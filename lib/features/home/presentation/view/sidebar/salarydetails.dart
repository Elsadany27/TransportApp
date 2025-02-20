import 'package:flutter/material.dart';

import '../../../data/data.dart';
import '../widgets/customeappbarSidebar.dart';

class SalaryDetails extends StatelessWidget {
   SalaryDetails({super.key});

   List<SalaryMonths> data=[
     SalaryMonths(monthname: "يناير",totalsaraly: "4000 ج.م"),
     SalaryMonths(monthname: "قراير",totalsaraly: "5000 ج.م"),
     SalaryMonths(monthname: "مارس",totalsaraly: "2500 ج.م"),
     SalaryMonths(monthname: "ابريل",totalsaraly: "7500 ج.م"),
     SalaryMonths(monthname: "ابريل",totalsaraly: "7500 ج.م"),
     SalaryMonths(monthname: "ابريل",totalsaraly: "7500 ج.م"),
     SalaryMonths(monthname: "ابريل",totalsaraly: "7500 ج.م"),
     SalaryMonths(monthname: "ابريل",totalsaraly: "7500 ج.م"),
   ];
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(children: [
        //appbar
        CustomeAppbarSidebar(texxt: "المرتب",color: Colors.black,),

        //card Visa
        Container(
          width: double.infinity,
          padding: EdgeInsets.only(left: screenSize.width*0.03,right: screenSize.width*0.03,top: screenSize.height*0.02),
          margin: EdgeInsets.only(left: screenSize.width*0.03,right: screenSize.width*0.03,top: screenSize.height*0.05),
          height:screenSize.height*0.22,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black38,
                  offset: const Offset(5.0, 5.0),
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                ),
              ],
              color: Colors.black,borderRadius: BorderRadius.circular(30)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [

              Text("يوسف السعدنى ",textDirection: TextDirection.rtl,style: TextStyle(color: Colors.white,fontSize: screenSize.width*0.06,fontWeight: FontWeight.bold),),
              Text("24225",style: TextStyle(color: Colors.white70),textDirection: TextDirection.rtl,),
              SizedBox(height: screenSize.height*0.035,),

              //total saraly
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text("بونص : 500 ج.م",style: TextStyle(fontSize: screenSize.width*0.04,fontWeight: FontWeight.bold,color: Colors.red),textDirection: TextDirection.rtl,),

                Container(
                  alignment: Alignment.bottomRight,
                  width: screenSize.width*0.55,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                  Text("الدخل الشهرى الى الان :2400 ج.م",style: TextStyle(color: Colors.white,fontSize: screenSize.width*0.04,fontWeight: FontWeight.bold,),textDirection: TextDirection.rtl,),SizedBox(height: screenSize.height*0.01,),
                  Text("الدخل اليومى :250 ج.م",style: TextStyle(color: Colors.white,fontSize: screenSize.width*0.03,fontWeight: FontWeight.w600,),),
                ],),),
              ],),
            ],
          ),
        ),

        //saraly months
        Container(
          margin: EdgeInsets.only(top: screenSize.height*0.05),
          padding: EdgeInsets.only(right: screenSize.width*0.02),
          height: screenSize.height*0.03,
          width: double.infinity,
          color: Colors.orange,
          child: Text("الدخل السنوى",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: screenSize.width*0.04),textDirection: TextDirection.rtl,),
        ),

        //salary all months
        Container(
          height: screenSize.height*0.5,
          child: ListView.separated(itemBuilder: (context, index) => ListTile(
            title: Text("${data[index].monthname}",textDirection:TextDirection.rtl,style: TextStyle(color: Colors.black,fontSize: screenSize.width*0.04,fontWeight: FontWeight.w700),),
            leading: Text("${data[index].totalsaraly}",textDirection:TextDirection.rtl,style: TextStyle(color: Colors.black,fontSize: screenSize.width*0.04,fontWeight: FontWeight.w700),),
          ),
              separatorBuilder: (context, index) => Divider(),
              itemCount: data.length),
        )
      ],),
    );
  }
}
