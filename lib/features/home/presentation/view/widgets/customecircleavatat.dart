import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trasportation/core/utilities/app_images.dart';
import 'package:trasportation/features/home/presentation/view%20model/homecubit.dart';
import 'package:trasportation/features/home/presentation/view%20model/homestate.dart';


class CustomeCircleAvatar extends StatelessWidget {
  CustomeCircleAvatar({super.key});
 
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return  BlocProvider(
  create: (context) => HomeCubit(),
  child: Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width:screenSize.width *0.006,color: Colors.orange)
      ),
      child: BlocConsumer<HomeCubit, HomeState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return CircleAvatar(
        radius: 30,
        backgroundImage: BlocProvider.of<HomeCubit>(context).urlimage==null?AssetImage(Assets.admin):NetworkImage("${BlocProvider.of<HomeCubit>(context).urlimage}"),
      );
  },
),
    ),
);
  }
}
