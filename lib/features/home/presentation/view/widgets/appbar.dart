import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trasportation/core/constant/CustomeElevatedBustton.dart';
import 'package:trasportation/features/home/presentation/view%20model/homecubit.dart';
import 'package:trasportation/features/home/presentation/view%20model/homestate.dart';

import '../../../../../core/utilities/app_images.dart';
import 'customesidebar.dart';

class Appbar extends StatelessWidget {
  const Appbar({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return  BlocProvider(
  create: (context) => HomeCubit(),
  child: Container(
      padding: EdgeInsets.only(top: screenSize.height*0.02,left: screenSize.width*0.02,right: screenSize.width*0.02),
      height:screenSize.height*0.15,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.black45, offset: const Offset(5.0,5.0,), blurRadius: 10.0, spreadRadius: 2.0,
            ), //BoxShadow//BoxShadow
          ],
          color: Colors.black,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(screenSize.height*0.15))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ListTile(
            trailing: CircleAvatar(radius: 25,backgroundImage:BlocProvider.of<HomeCubit>(context).urlimage==null? AssetImage(Assets.admin):NetworkImage("${BlocProvider.of<HomeCubit>(context).urlimage}"),backgroundColor: Colors.white,),
            title: Text("مرحبا يوسف ..👋 ",style: TextStyle(color: Colors.white,fontSize: screenSize.width*0.06,fontWeight: FontWeight.bold),textDirection: TextDirection.rtl,),
            subtitle: Text("اتمنى لك يوما سعيدا ",style: TextStyle(color: Colors.white70,fontSize: screenSize.width*0.04,fontWeight: FontWeight.w500),textDirection: TextDirection.rtl,),
            leading: IconButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => CustomeSidebar(),));
            }, icon: Icon(Icons.horizontal_split_outlined),color: Colors.white,),
            isThreeLine: true,
          ),

        ],
      ),
    ),
);
  }
}
