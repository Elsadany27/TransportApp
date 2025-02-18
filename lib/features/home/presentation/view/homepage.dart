import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:trasportation/features/home/presentation/view/widgets/appbar.dart';
import 'package:trasportation/features/home/presentation/view/widgets/customeMap.dart';
import 'package:trasportation/features/home/presentation/view/widgets/customecontainerFeatures.dart';
import 'package:trasportation/features/login/presentation/view/widgets/customeTextformfield.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // Function that gets the picked location
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
            //map
            Container(
              margin: EdgeInsets.only(top: screenSize.height*0.2),
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
                    Center(child: Text("رمسيس ==> مرسي مطروح",style: TextStyle(fontWeight: FontWeight.w400,fontSize: screenSize.width*0.04,color: Colors.green,letterSpacing: 2.2))),
                    //features
                    CustomeContainerFeatures(),
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
