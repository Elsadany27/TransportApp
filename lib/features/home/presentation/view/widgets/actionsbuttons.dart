import 'package:flutter/material.dart';
import 'package:trasportation/core/constant/CustomeElevatedBustton.dart';
import 'package:trasportation/features/login/presentation/view/widgets/customeTextformfield.dart';

class ActionsButtons extends StatefulWidget {
  const ActionsButtons({super.key});

  @override
  State<ActionsButtons> createState() => _ActionsButtonsState();
}

class _ActionsButtonsState extends State<ActionsButtons> {

  TextEditingController money=TextEditingController();
  TextEditingController litter=TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return
      Container(
        alignment: Alignment.topLeft,
        width: screenSize.width*0.2,
        child: MaterialButton(onPressed: (){
          showDialog(context: context, builder: (context) => AlertDialog(elevation: 25,shadowColor: Colors.black,title: Center(child: Text("التفويل")),
            content: Container(
              height: screenSize.height*0.19,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(child: CustomeTextformfield(controller: money,type: TextInputType.number,ontap: (){},secure: false,textt: " المبلغ ",)),SizedBox(width: screenSize.width*0.01,),
                      Expanded(child: CustomeTextformfield(controller: litter,type: TextInputType.number,ontap: (){},secure: false,textt: " اللترات",)),
                    ],
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: CustomeElevatedBustton(ontap: (){},textt: "ادخال",))
                ],
              ),
            ),),);
        },child: Text(" تفويل",style: TextStyle(fontSize: screenSize.width*0.035,fontWeight: FontWeight.bold),),elevation: 25,shape: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),),
      );
  }
}
