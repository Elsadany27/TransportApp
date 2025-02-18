import 'package:flutter/material.dart';
import 'package:trasportation/core/constant/CustomeElevatedBustton.dart';
import 'package:trasportation/features/login/presentation/view/widgets/customeTextformfield.dart';

class ActionsButtons extends StatefulWidget {
  const ActionsButtons({super.key});

  @override
  State<ActionsButtons> createState() => _ActionsButtonsState();
}

class _ActionsButtonsState extends State<ActionsButtons> {

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
      MaterialButton(onPressed: (){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("تم تسجيل الدفع")));
      },child: Text("دفع كارته",style: TextStyle(fontSize: screenSize.width*0.035,fontWeight: FontWeight.bold),),elevation: 25,shape: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),),

      MaterialButton(onPressed: (){
        showDialog(context: context, builder: (context) => AlertDialog(elevation: 25,shadowColor: Colors.black,title: Center(child: Text("المبلغ")),
          content: Container(
            height: screenSize.height*0.19,
            child: Column(
              children: [
                CustomeTextformfield(ontap: (){},secure: false,textt: "ادخل المبلغ ",),
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: CustomeElevatedBustton(ontap: (){},textt: "ادخال",))
              ],
            ),
          ),),);
      },child: Text(" تفويل",style: TextStyle(fontSize: screenSize.width*0.035,fontWeight: FontWeight.bold),),elevation: 25,shape: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),),
    ],);
  }
}
