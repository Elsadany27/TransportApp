import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latlong2/latlong.dart';
import 'package:trasportation/features/home/presentation/view%20model/homecubit.dart';
import 'package:trasportation/features/home/presentation/view%20model/homestate.dart';
import 'package:trasportation/features/home/presentation/view/widgets/Customestepper.dart';
import 'package:trasportation/features/home/presentation/view/widgets/actionsbuttons.dart';
import 'package:trasportation/features/home/presentation/view/widgets/appbar.dart';
import 'package:trasportation/features/home/presentation/view/widgets/customeMap.dart';
import 'package:trasportation/features/login/presentation/view/widgets/customeTextformfield.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  void _onLocationPicked(LatLng location) {
    print('Location picked: ${location.latitude}, ${location.longitude}');
  }
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: screenSize.height*0.17),
              child: Padding(
                padding:  EdgeInsets.only(right: screenSize.width*0.02,left: screenSize.width*0.02,),
                child: ListView(
                  children: [
                    //start journey
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      textDirection: TextDirection.rtl,
                      children: [
                        Text("خط السير : ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: screenSize.width*0.06),textDirection: TextDirection.rtl,),
                        Text("${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}",style: TextStyle(fontSize: screenSize.width*0.04,fontWeight: FontWeight.bold),)
                      ],
                    ),SizedBox(width: screenSize.width*0.01,),
                    Center(child: BlocConsumer<HomeCubit, HomeState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        return Text("رمسيس ==> التجمع الخامس",style: TextStyle(fontWeight: FontWeight.bold,fontSize: screenSize.width*0.04,color:BlocProvider.of<HomeCubit>(context).text=="انهاء الشيفت"? Colors.red:Colors.green,letterSpacing: 2.0));
                      },
                    )),

                    //buttons carta / petrol
                    ActionsButtons(),
                    //step ponits
                    CustomeStepper(),
                    //map
                    CustomeMap(),
                    //search by
                    SizedBox(height: screenSize.height*0.02,),
                    CustomeTextformfield(secure: false, ontap: (){},textt: "حدد منطقة البدايه",preicon: Icon(Icons.location_on_outlined),),
                    SizedBox(height: screenSize.height*0.05,)
                  ],
                ),
              ),
            ),
            //appbar
            Appbar(),
          ],
        ),
      ),
    );
  }
}
