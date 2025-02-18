import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trasportation/features/home/presentation/view%20model/homestate.dart';

class HomeCubit extends Cubit<HomeState>{
  HomeCubit():super(ChangeState());

  //change color and text
  String text="ابدا الشيفت";
  Color color=Colors.red;

  changeText(){
    if(text=="ابدا الشيفت" && color==Colors.red){
      text="انهاء الشيفت";
      color=Colors.blueAccent;
      emit(ChangeState());
    }
    else{
       text="ابدا الشيفت";
       color=Colors.red;
      emit(UnchangeState());
    }
  }
}