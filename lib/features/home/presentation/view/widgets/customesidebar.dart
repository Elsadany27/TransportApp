import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trasportation/features/home/data/model/driver_model.dart';
import 'package:trasportation/features/home/presentation/view%20model/homecubit/homecubit.dart';
import 'package:trasportation/features/home/presentation/view/sidebar/salarydetails.dart';
import 'package:trasportation/features/login/presentation/view/requestresetpassword.dart';
import '../../../../../core/utilities/app_images.dart';
import '../../view model/homecubit/homestate.dart';
import 'ImageWithTextSidebar.dart';
import '../sidebar/journeyhistories.dart';

class CustomeSidebar extends StatelessWidget {
  CustomeSidebar({super.key,this.passSide,this.emailside});
  String? emailside,passSide;
  DriverModel? dataaDriver;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return BlocProvider(
  create: (context) => HomeCubit()..getDriverInfo(emailside!, passSide!),
  child: Scaffold(
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
                margin: EdgeInsets.only(top: screenSize.height*0.050,left: screenSize.width*0.010,bottom: screenSize.height*0.08),
                alignment: Alignment.center,
                height:screenSize.height* 0.110,
                width: screenSize.width,
                decoration: BoxDecoration(
                  border: Border.all(width:screenSize.width*0.001,color: Colors.white),
                  borderRadius: BorderRadius.only(topRight: Radius.circular(100),bottomRight: Radius.circular(100)),),
                child: BlocBuilder<HomeCubit,HomeState>(builder: (context, state) {
                  if(state is IsloadingDriverInfo){
                    return CircleAvatar(backgroundColor: Colors.black,radius: 20,child: CircularProgressIndicator(backgroundColor: Colors.red,),);
                  }
                  else if (state is SuccessDriverInfo){
                    dataaDriver=state.driverData!;
                    return ListTile(
                      title:Text("${dataaDriver!.result!.user!.name}",style: TextStyle(color: Colors.white,fontSize: screenSize.width*0.035),textDirection: TextDirection.rtl,) ,
                      // trailing: CustomeCircleAvatar(),
                      subtitle: Text("${dataaDriver!.result!.user!.email}",style: TextStyle(color: Colors.white60),textDirection: TextDirection.rtl,),
                    );
                  }
                  else{
                    return Text("no data");
                  }
                },)
              ),

              //properties
              ImageWithTextMenu(ontap: (){
                BlocProvider.of<HomeCubit>(context).editImage();
              },image: "${Assets.edit}",text: "تغير الصورة",),
              Divider(height: screenSize.height*0.01,color: Colors.white),

              ImageWithTextMenu(ontap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => SalaryDetails(email: emailside,pass: passSide,),));
              },image: "${Assets.money}",text: "الراتب",),
              Divider(height: screenSize.height*0.01,color: Colors.white),

              ImageWithTextMenu(ontap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => JourneyHistories(),));
              },image: "${Assets.date}",text: "تواريخ الرحلات",),
              Divider(height: screenSize.height*0.01,color: Colors.white),

              ImageWithTextMenu(ontap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => RequestResetPassword(),));
              },image: "${Assets.changepassword}",text: "تغير كلمة السر ",),
              Divider(height: screenSize.height*0.01,color: Colors.white),

              ImageWithTextMenu(ontap: (){},image: "${Assets.date}",text: "نبذه عننا",),
              Divider(height: screenSize.height*0.01,color: Colors.white),

            ],),),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(top:screenSize.height*0.1, ),
                  width: screenSize.width*0.13,
                  height: screenSize.height,
                  color: Colors.orange,
                  child:IconButton(onPressed: (){
                    Navigator.of(context).pop();
                  },icon:Icon(Icons.arrow_left,size: screenSize.width*0.14,)),
                )],
            ),
            Container(margin: EdgeInsets.only(bottom: screenSize.height*0.04),alignment: Alignment.bottomLeft,child: Image.asset(Assets.logo,height: screenSize.height*0.25,)),
          ]),
    ),

);
  }
}
