import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trasportation/features/login/presentation/view%20model/loginstate.dart';

class LoginCubit extends Cubit<LoginState>{
  LoginCubit():super (VisabilityState());

  //state password
  bool statee=true;
  changeState(){
    if(statee==true){
      statee=false;
      emit(VisabilityState());
    }else{
      statee=true;
      emit(UnvisabilityState());
    }
  }


}