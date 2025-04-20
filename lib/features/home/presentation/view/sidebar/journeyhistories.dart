// import 'package:flutter/material.dart';
// import 'package:trasportation/core/utilities/app_images.dart';
// import 'package:trasportation/features/home/data/data.dart';
//
// import '../../../../../core/utilities/component/customeappbarSidebar.dart';
//
// class JourneyHistories extends StatelessWidget {
//    JourneyHistories({super.key});
//
//    List<JourneyHistoriesData> data=[
//      JourneyHistoriesData(day:"${DateTime.now().year} - ${DateTime.now().month} - ${DateTime.now().day}" ,jorneyname:"رمسيس ===> التجمع الخامس" ),
//      JourneyHistoriesData(day:"${DateTime.now().year} - ${DateTime.now().month} - ${DateTime.now().day}" ,jorneyname:"رمسيس ===>  العاصمه الاداريه" ),
//      JourneyHistoriesData(day:"${DateTime.now().year} - ${DateTime.now().month} - ${DateTime.now().day}" ,jorneyname:"رمسيس ===>  الاسكندريه" ),
//      JourneyHistoriesData(day:"${DateTime.now().year} - ${DateTime.now().month} - ${DateTime.now().day}" ,jorneyname:"رمسيس ===> مرسي مطروح " ),
//    ];
//   @override
//   Widget build(BuildContext context) {
//     final screenSize = MediaQuery.of(context).size;
//     return Scaffold(
//       body: Column(children: [
//         //appbar
//         CustomeAppbarSidebar(texxt: "تواريخ الرحلات",color: Colors.black,),
//         //count of journeys
//         Container(
//           margin: EdgeInsets.only(top: screenSize.height*0.03),
//           height: screenSize.height*0.03,
//           width: double.infinity,
//           color: Colors.orange,
//           child: Text(" عدد الرحلات فى الشهر: ${data.length}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: screenSize.width*0.04),textDirection: TextDirection.rtl,),
//         ),
//
//         //list
//         Container(
//           height: screenSize.height*0.6,
//           child: ListView.separated(itemBuilder: (context, index) => ListTile(
//             title: Text("${data[index].jorneyname}",textDirection:TextDirection.rtl,style: TextStyle(fontSize: screenSize.width*0.04,fontWeight: FontWeight.w700),),
//             subtitle: Text("${data[index].day}",textDirection:TextDirection.rtl,style: TextStyle(color: Colors.black26,fontSize: screenSize.width*0.03,fontWeight: FontWeight.w700),),
//             leading: Text("مكتمله",textDirection:TextDirection.rtl,style: TextStyle(color: Colors.red,fontSize: screenSize.width*0.03,fontWeight: FontWeight.w700),),
//           ),
//               separatorBuilder: (context, index) => Divider(color: Colors.black,),
//               itemCount: data.length),
//         )
//       ],),
//     );
//   }
// }
