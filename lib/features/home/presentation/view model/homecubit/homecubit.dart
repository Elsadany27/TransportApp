import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trasportation/features/home/data/model/driver_model.dart';
import 'package:trasportation/features/home/data/model/routes_model.dart';

import '../../../data/datasource/homedatasource.dart';
import 'homestate.dart';

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


  //image
  String? urlimage;
  String? im;
  File? file;

  // Method to pick and upload the image
  editImage() async {
    emit(InitialState());
    final ImagePicker picker = ImagePicker();
    // Pick an image from gallery
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) {
      emit(FailureState(error: 'No image selected'));
      return;
    }

    file = File(image.path);
    var imagename = basename(image.path);

    try {
      // Upload image to Firebase storage
      var refimage = FirebaseStorage.instance.ref("Profile/TransportImages/$imagename");
      await refimage.putFile(file!);

      // Get download URL for the uploaded image
      urlimage = await refimage.getDownloadURL();
      im = urlimage;
      print(im);
      emit(DisplayImage()); // Image uploaded successfully
    } catch (e) {
      emit(FailureState(error: e.toString())); // Handle errors
    }
  }

  //route data
  getRouteDriver(String email,String pass)async{
    RouteModel? datta;
    HomeDataSource homeDataSource=HomeDataSource();
    emit(IsloadingRoute());
    print(homeDataSource.idDriverr);
    try{
      datta=await homeDataSource.getRouteDriver(email, pass,context);
      print(datta);
      emit(SuccessRoute(data: datta));
    }catch(e){
      print(e);
      emit(FailureRoute(errorMessage: e.toString()));
    }
  }

  //get driver info
  getDriverInfo(String mail,String password)async{
    DriverModel? dataDriver;
    HomeDataSource _homeDataSorurce=HomeDataSource();
    emit(IsloadingDriverInfo());
    try{
      dataDriver=await _homeDataSorurce.getDriverInfo(mail, password,context);
      print(dataDriver);
      emit(SuccessDriverInfo(driverData: dataDriver));
    }catch(e){
      print(e);
      emit(FailureDriverInfo(errorMessage: e.toString()));
    }
  }

}