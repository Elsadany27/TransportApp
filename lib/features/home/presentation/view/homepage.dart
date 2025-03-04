import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latlong2/latlong.dart';
import 'package:trasportation/features/home/data/model/model.dart';
import 'package:trasportation/features/home/presentation/view%20model/homecubit.dart';
import 'package:trasportation/features/home/presentation/view%20model/homestate.dart';
import 'package:trasportation/features/home/presentation/view/widgets/Customestepper.dart';
import 'package:trasportation/features/home/presentation/view/widgets/actionsbuttons.dart';
import 'package:trasportation/features/home/presentation/view/widgets/appbar.dart';
import 'package:trasportation/features/home/presentation/view/widgets/customeMap.dart';
import 'package:trasportation/features/login/presentation/view/widgets/customeTextformfield.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key,this.emaill,this.passs});

  String? emaill,passs;
  RouteModel? dataa=RouteModel();
  void _onLocationPicked(LatLng location) {
    print('Location picked: ${location.latitude}, ${location.longitude}');
  }
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return BlocProvider(
  create: (context) => HomeCubit()..getRouteDriver(emaill.toString(), passs.toString()),
  child: Scaffold(
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
                    Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //buttons carta / petrol
                        ActionsButtons(),
                        Center(child: BlocConsumer<HomeCubit, HomeState>(
                          listener: (context, state) {},
                          builder: (context, state) {
                            return Text("رمسيس ==> التجمع الخامس",style: TextStyle(fontWeight: FontWeight.bold,fontSize: screenSize.width*0.04,color:BlocProvider.of<HomeCubit>(context).text=="انهاء الشيفت"? Colors.red:Colors.green,letterSpacing: 1.5));
                          },
                        )),
                      ],
                    ),


                    //test
                    Container(
                      height: screenSize.height*0.2,
                      child: BlocBuilder<HomeCubit,HomeState>(builder: (context, state) {
                        if(state is IsloadingRoute){
                          return CircularProgressIndicator();
                        }
                        else if (state is SuccessRoute){
                          dataa=state.data;
                          return Text("${state.data!.result!.data!.driverName}");
                        }
                        else if(state is FailureRoute){
                          return Text("${state.errorMessage}");
                        }
                        else{
                          return Text("no data");
                        }
                      },),
                    ),
                    //step ponits
                    CustomeStepper(),
                    //map
                    CustomeMap(),
                    //search by
                    SizedBox(height: screenSize.height*0.02,),
                    CustomeTextformfield(type: TextInputType.text,secure: false, ontap: (){},textt: "حدد منطقة البدايه",preicon: Icon(Icons.location_on_outlined),),
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
    ),
);
  }
}


