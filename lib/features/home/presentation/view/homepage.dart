// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:latlong2/latlong.dart';
// import 'package:trasportation/features/home/data/data.dart';
// import 'package:trasportation/features/home/data/model/routes_model.dart';
// import 'package:trasportation/features/home/presentation/view%20model/homecubit.dart';
// import 'package:trasportation/features/home/presentation/view%20model/homestate.dart';
// import 'package:trasportation/features/home/presentation/view/widgets/Customestepper.dart';
// import 'package:trasportation/features/home/presentation/view/widgets/actionsbuttons.dart';
// import 'package:trasportation/features/home/presentation/view/widgets/appbar.dart';
// import 'package:trasportation/features/home/presentation/view/widgets/customeMap.dart';
// import 'package:trasportation/features/login/presentation/view/widgets/customeTextformfield.dart';
//
// class HomePage extends StatelessWidget {
//   HomePage({super.key,this.emaill,this.passs});
//
//   String? emaill,passs;
//   RouteModel? dataa=RouteModel();
//   void _onLocationPicked(LatLng location) {
//     print('Location picked: ${location.latitude}, ${location.longitude}');
//   }
//   @override
//   Widget build(BuildContext context) {
//     final screenSize = MediaQuery.of(context).size;
//     return BlocProvider(
//   create: (context) => HomeCubit()..getRouteDriver(emaill.toString(), passs.toString()),
//   child: Scaffold(
//       body: SafeArea(
//         child: Stack(
//           children: [
//            BlocBuilder<HomeCubit,HomeState>(builder: (context, state) {
//              if(state is IsloadingRoute){
//                return CircleAvatar(backgroundColor: Colors.black,child: CircularProgressIndicator(backgroundColor: Colors.red,),radius: 15,);
//              }
//              else if (state is FailureRoute){
//                return Center(child: Text("${state.errorMessage}"));
//              }
//              else if(state is SuccessRoute){
//                dataa=state.data;
//                return  Container(
//                  margin: EdgeInsets.only(top: screenSize.height*0.17),
//                  child: Padding(
//                    padding:  EdgeInsets.only(right: screenSize.width*0.02,left: screenSize.width*0.02,),
//                    child: ListView.builder(
//                      itemCount: dataa!.result!.data!.routes!.length,
//                      itemBuilder: (context, index) =>Column(children: [
//
//                        //start journey
//                        Row(
//                          mainAxisAlignment: MainAxisAlignment.center,
//                          textDirection: TextDirection.rtl,
//                          children: [
//                            Text("خط السير : ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: screenSize.width*0.06),textDirection: TextDirection.rtl,),
//                            Text("${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}",style: TextStyle(fontSize: screenSize.width*0.04,fontWeight: FontWeight.bold),)
//                          ],
//                        ),SizedBox(width: screenSize.width*0.01,),
//                        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                          children: [
//                            //buttons carta / petrol
//                            ActionsButtons(),
//                            Center(child: BlocConsumer<HomeCubit, HomeState>(
//                              listener: (context, state) {},
//                              builder: (context, state) {
//                                return Text("${dataa!.result!.data!.routes![index].route!.name}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: screenSize.width*0.04,color:BlocProvider.of<HomeCubit>(context).text=="انهاء الشيفت"? Colors.red:Colors.green,letterSpacing: 1.5));
//                              },
//                            )),
//                          ],
//                        ),
//
//                        //step ponits
//                        CustomeStepper(),
//                        //map
//                        CustomeMap(),
//                        //search by
//                        SizedBox(height: screenSize.height*0.02,),
//                        CustomeTextformfield(type: TextInputType.text,secure: false, ontap: (){},textt: "حدد منطقة البدايه",preicon: Icon(Icons.location_on_outlined),),
//                        SizedBox(height: screenSize.height*0.05,)
//                      ],)),
//                  ),
//                );
//              }
//              else{
//                return  Text("No data , please Check data");
//              }
//
//            },),
//             //appbar
//             Appbar(),
//           ],
//         ),
//       ),
//     ),
// );
//   }
// }
//
//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latlong2/latlong.dart';
import 'package:trasportation/features/home/data/model/routes_model.dart';
import 'package:trasportation/features/home/presentation/view%20model/homecubit/homecubit.dart';
import 'package:trasportation/features/home/presentation/view/widgets/Customestepper.dart';
import 'package:trasportation/features/home/presentation/view/widgets/actionsbuttons.dart';
import 'package:trasportation/features/home/presentation/view/widgets/appbar.dart';
import 'package:trasportation/features/home/presentation/view/widgets/customeMap.dart';
import 'package:trasportation/features/login/presentation/view/widgets/customeTextformfield.dart';

import '../view model/homecubit/homestate.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key, this.emaill, this.passs});

  final String? emaill, passs;
  RouteModel? dataa;

  void _onLocationPicked(LatLng location) {
    print('Location picked: ${location.latitude}, ${location.longitude}');
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => HomeCubit()..getRouteDriver(emaill ?? '', passs ?? ''),
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is IsloadingRoute) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is FailureRoute) {
                    return Center(child: Text("${state.errorMessage}"));
                  } else if (state is SuccessRoute) {
                    dataa = state.data;
                    return Container(
                      margin: EdgeInsets.only(top: screenSize.height * 0.17),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.02),
                        child: ListView.builder(
                          itemCount: dataa!.result!.data!.routes!.length,
                          itemBuilder: (context, index) => Column(
                            children: [
                              Row(children: [
                                  Expanded(
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        textDirection: TextDirection.rtl,
                                        children: [
                                          Text(" التاريخ : ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: screenSize.width*0.04),textDirection: TextDirection.rtl,),
                                          Text("${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}",style: TextStyle(fontSize: screenSize.width*0.03,fontWeight: FontWeight.bold),)
                                        ],),
                                    ),
                                  ),

                                  Expanded(
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        textDirection: TextDirection.rtl,
                                        children: [
                                          Text("موديل الباص : ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: screenSize.width*0.04),textDirection: TextDirection.rtl,),
                                          Text("${dataa!.result!.data!.routes![index].bus!.name}",style: TextStyle(fontSize: screenSize.width*0.03,fontWeight: FontWeight.bold),)
                                        ],),
                                    ),
                                  ),
                                ],
                              ),
                              
                              SizedBox(width: screenSize.width * 0.01),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  ActionsButtons(),
                                  Center(
                                    child: BlocConsumer<HomeCubit, HomeState>(
                                      listener: (context, state) {},
                                      builder: (context, state) {
                                        return Text("${dataa!.result!.data!.routes![index].route!.name}",
                                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: screenSize.width * 0.04,
                                              color: BlocProvider.of<HomeCubit>(context).text == "انهاء الشيفت" ? Colors.red: Colors.green, letterSpacing: 1.5),);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              CustomeStepper(routeData: dataa!),
                              CustomeMap(),
                              SizedBox(height: screenSize.height * 0.02),
                              CustomeTextformfield(
                                borderColor: Colors.black,
                                hintstyle: TextStyle(color: Colors.black),styleTextColor: Colors.black,
                                type: TextInputType.text,
                                secure: false,
                                ontap: () {},
                                textt: "حدد منطقة البدايه",
                                preicon: Icon(Icons.location_on_outlined),
                              ),
                              SizedBox(height: screenSize.height * 0.05),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Center(child: Text("ليس هناك خط سير"));
                  }
                },
              ),
              Appbar(emaildriver: emaill,passdriver: passs,),
            ],
          ),
        ),
      ),
    );
  }
}