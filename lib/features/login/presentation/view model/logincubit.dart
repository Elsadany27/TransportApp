// import 'package:dio/dio.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:trasportation/features/login/data/homedatasource.dart';
// import 'package:trasportation/features/login/presentation/view%20model/loginstate.dart';
// import 'package:trasportation/features/login/presentation/view/forgetpassword.dart';
// import 'package:trasportation/features/login/presentation/view/loginpage.dart';
// import 'package:trasportation/features/login/presentation/view/qrScaanPage.dart';
//
// class LoginCubit extends Cubit<LoginState> {
//   LoginCubit() :super (InitialState());
//   Dio dio = Dio();
//   DataSource dataSource=DataSource();
//   //state password
//   bool statee = true;
//
//   changeState() {
//     if (statee == true) {
//       statee = false;
//       emit(VisabilityState());
//     } else {
//       statee = true;
//       emit(UnvisabilityState());
//     }
//   }
//
//   //driver login
//   int? iddrivr;
//
//   loggin({required String email, required String pass,required BuildContext context}) async {
//     emit(IsLoadingState());
//     try{
//       iddrivr=await dataSource.authenticateAndFetchDriverId(email, pass);
//
//       if(iddrivr!=null){
//         emit(SuccessState());
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("تم تسجيل الدخول بنحاح")));
//         Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => QrScaanPage(),), (route) => false);
//       }
//       else{
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("كلمة المرور او الااكونت خطا")));
//       }
//
//     }catch(e){
//       emit(FailureState(errorMessage: e.toString()));
//     }
//   }
//
//
//   //request reset pass
//   String? token;
//   requestResetPass(email,context)async{
//     emit(IsLoadingRequestPass());
//     try{
//       token=await dataSource.getTokenResetPass(email);
//       print(token);
//       emit(SuccessRequestPass());
//       Navigator.of(context).push(MaterialPageRoute(builder: (context) => ForgetPassword(),));
//     }catch(e){
//       emit(FailureRequestPass(
//         errorMessage: e.toString()
//       ));
//     }
//   }
//
//   //reset pass
//   Future<String?> resetPassword({required String email,required String pass,context})async{
//     String? message;
//     emit(IsLoadingResetPassword());
//     try{
//       message =await dataSource.resetPassword(email: email,password: pass);
//       emit(SuccessResetPassword());
//       print(message);
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("تم تغيير كلمة المرور")));
//       Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => LoginPage(),), (route) => false,);
//     }catch(e){
//       emit(FailureResetPassword(errorMessage:e.toString()));
//     }
//   }
// }



//2/3/2025
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trasportation/features/login/data/datasource.dart';
import 'package:trasportation/features/login/presentation/view model/loginstate.dart';
import 'package:trasportation/features/login/presentation/view/forgetpassword.dart';
import 'package:trasportation/features/login/presentation/view/loginpage.dart';
import 'package:trasportation/features/login/presentation/view/qrScaanPage.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(InitialState());
  Dio dio = Dio();
  DataSourceLogin dataSource = DataSourceLogin();

  bool statee = true;

  void changeState() {
    statee = !statee; // Toggle the state
    if (statee) {
      emit(UnvisabilityState());
    } else {
      emit(VisabilityState());
    }
  }

  // Driver login
  int? iddrivr;

  Future<void> loggin({required String email, required String pass, required BuildContext context}) async {
    emit(IsLoadingState());
    try {
      iddrivr = await dataSource.authenticateAndFetchDriverId(email, pass,context);
      if (iddrivr != null) {
        emit(SuccessState());
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("تم تسجيل الدخول بنجاح"))); // Successful login message
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => QrScaanPage(email: email,pass: pass,)), (route) => false);
      } else {
        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("كلمة المرور او الاكونت خطا"))); // Successful login message
        emit(FailureState(errorMessage: "Failed to login")); // Provide clearer feedback
      }
    } catch (e) {
      emit(FailureState(errorMessage: e.toString()));
    }
  }

  // Request reset password
  String? token;

  Future<void> requestResetPass(String email, BuildContext context) async {
    emit(IsLoadingRequestPass());
    try {
      token = await dataSource.getTokenResetPass(email);
      if (token != null) {
        emit(SuccessRequestPass());
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ForgetPassword()));
      } else {
        emit(FailureRequestPass(errorMessage: "Failed to retrieve reset token")); // Include error message
      }
    } catch (e) {
      emit(FailureRequestPass(errorMessage: e.toString()));
    }
  }

  // Reset password
  Future<void> resetPassword({required String email, required String pass, required BuildContext context}) async {
    String? message;
    emit(IsLoadingResetPassword());
    try {
      message = await dataSource.resetPassword(email: email, password: pass);
      if (message != null) {
        emit(SuccessResetPassword());
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("تم تغيير كلمة المرور بنجاح"))); // Provide success message
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => LoginPage()), (route) => false);
      } else {
        emit(FailureResetPassword(errorMessage: "Failed to reset password")); // Handle failure
      }
    } catch (e) {
      emit(FailureResetPassword(errorMessage: e.toString()));
    }
  }
}


