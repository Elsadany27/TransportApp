import 'package:flutter/material.dart';

class CustomeTextformfield extends StatelessWidget {
   CustomeTextformfield({super.key,this.textt,required this.secure,this.controller,this.preicon,this.suffixicon,required this.ontap});
  String? textt;
  TextEditingController? controller;
  bool secure;
  Icon? preicon;
  IconData? suffixicon;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      obscureText:secure ,
       controller: controller,
      decoration: InputDecoration(
        prefixIcon:preicon,
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        hintText: textt,
        suffixIcon: IconButton(onPressed: ontap, icon: Icon(suffixicon))
      ),
    );
  }
}
