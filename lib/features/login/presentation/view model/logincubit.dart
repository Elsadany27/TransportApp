import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trasportation/features/home/data/datasource.dart';
import 'package:trasportation/features/login/presentation/view%20model/loginstate.dart';
import 'package:trasportation/features/login/presentation/view/qrScaanPage.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() :super (InitialState());
  Dio dio = Dio();

  //state password
  bool statee = true;

  changeState() {
    if (statee == true) {
      statee = false;
      emit(VisabilityState());
    } else {
      statee = true;
      emit(UnvisabilityState());
    }
  }

  //driver login
  int? iddrivr;
  DataSource _dataSource=DataSource();
  loggin({required String email, required String pass,required BuildContext context}) async {
    emit(IsLoadingState());
    try{
      iddrivr=await _dataSource.authenticateAndFetchDriverId(email, pass);
      emit(SuccessState());
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("تم تسجيل الدخول بنحاح")));
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => QrScaanPage(),), (route) => false);
    }catch(e){
      emit(FailureState(errorMessage: e.toString()));
    }
  }
}
