import 'package:flutter/material.dart';

class CustomeTextformfield extends StatelessWidget {
   CustomeTextformfield({super.key,this.borderColor,this.styleTextColor,this.hintstyle,required this.type,this.textt,required this.secure,this.controller,this.preicon,this.suffixicon,required this.ontap});
  String? textt;
  TextEditingController? controller;
   TextInputType? type;
   Color? styleTextColor;
   Color? borderColor;
  bool secure;
  Icon? preicon;
  IconData? suffixicon;
  final VoidCallback ontap;
  final hintstyle;
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      validator: (value) {
        if(value!.isEmpty){
          return "الحقل فارغ";
        }
      },
      style: TextStyle(color: styleTextColor),
      keyboardType:type,
      obscureText:secure ,
       controller: controller,
      decoration: InputDecoration(
        prefixIcon:preicon,
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: borderColor!)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: borderColor!)),
        hintText: textt,
        hintStyle: hintstyle,
        suffixIcon: IconButton(onPressed: ontap, icon: Icon(suffixicon),color: Colors.white,)
      ),
    );
  }
}
