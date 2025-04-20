import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trasportation/core/widgets/custome_loading_indicator.dart';
import 'package:trasportation/features/home/data/model/driver_model.dart';
import 'package:trasportation/features/home/presentation/view%20model/homecubit/homecubit.dart';
import '../../../data/datasource/homedatasource.dart';
import '../../view model/homecubit/homestate.dart';
import '../sidebar.dart';

class Appbar extends StatelessWidget {
   Appbar({super.key,this.passdriver,this.emaildriver});
    String? emaildriver,passdriver;
    DriverModel driverDataa=DriverModel();

  @override
  Widget build(BuildContext context) {
    HomeDataSource homeDataSource=HomeDataSource();
    final screenSize = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => HomeCubit()..getDriverInfo(emaildriver ?? '', passdriver ?? ''),
      child: Container(
        padding: EdgeInsets.only(
            top: screenSize.height * 0.02,
            left: screenSize.width * 0.02,
            right: screenSize.width * 0.02),
        height: screenSize.height * 0.15,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black45,
              offset: const Offset(5.0, 5.0),
              blurRadius: 10.0,
              spreadRadius: 2.0,
            ),
          ],
          color: Colors.black,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(screenSize.height * 0.15)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           BlocBuilder<HomeCubit,HomeState>(builder: (context, state){
             if(state is IsloadingDriverInfo){
               return Center(child: const CustomeLoadingIndicator());
             }
             else if (state is SuccessDriverInfo){
               driverDataa=state.driverData!;
               return  ListTile(
                 // title: Text("مرحبا يوسف ..👋 ",style: TextStyle(color: Colors.white,fontSize: screenSize.width * 0.06,fontWeight: FontWeight.bold), textDirection: TextDirection.rtl,),
                 title: Text("${driverDataa.result!.user!.name} ..👋",style: TextStyle(color: Colors.white,fontSize: screenSize.width * 0.06,fontWeight: FontWeight.bold), textDirection: TextDirection.rtl,),
                 subtitle: Text("اتمنى لك يوما سعيدا ", style: TextStyle(color: Colors.white70,fontSize: screenSize.width * 0.04,fontWeight: FontWeight.w500),textDirection: TextDirection.rtl,),
                 leading: IconButton(
                   onPressed: () {
                     Navigator.of(context).push(MaterialPageRoute(builder: (context) => CustomeSidebar(emailside: emaildriver,passSide: passdriver,),));
                   },
                   icon: Icon(Icons.horizontal_split_outlined,color: Colors.white,),
                 ),
                 isThreeLine: true,
               );
             }
             else if(state is FailureDriverInfo){
               return Text("${state.errorMessage}",style: TextStyle(color: Colors.black),);
             }
             else{
               return Text("no data",style: TextStyle(color: Colors.black),);
             }
           },)
          ],
        ),
      ),
    );
  }
}
