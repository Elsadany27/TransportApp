import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
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


  //image
  String? urlimage;
  String? im;
  File? file;
  //images
  editImage()async{
    emit(IsloadingImage());
    final ImagePicker picker = ImagePicker();
// Pick an image.
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    // Capture a photo.
    // final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    file=File(image!.path);

    var imagename=basename(image.path);

    var refimage=FirebaseStorage.instance.ref("Profile/TransportImages/$imagename");
    await refimage.putFile(file!);
    urlimage=await refimage.getDownloadURL();
    im=urlimage;
    print(im);
    emit(DisplayImage());
  }
}