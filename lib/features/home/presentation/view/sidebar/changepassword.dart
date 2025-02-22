import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trasportation/core/constant/CustomeElevatedBustton.dart';
import 'package:trasportation/features/home/presentation/view/widgets/customeappbarSidebar.dart';
import 'package:trasportation/features/login/presentation/view%20model/logincubit.dart';
import 'package:trasportation/features/login/presentation/view%20model/loginstate.dart';
import 'package:trasportation/features/login/presentation/view/widgets/customeTextformfield.dart';

class ChangePassword extends StatelessWidget {
   ChangePassword({super.key});

   TextEditingController oldpass=TextEditingController();
   TextEditingController newpass=TextEditingController();
   TextEditingController confirmnewpass=TextEditingController();

   GlobalKey<FormState> keychangepass=GlobalKey();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return BlocProvider(
  create: (context) => LoginCubit(),
  child: Scaffold(
      body: BlocConsumer<LoginCubit, LoginState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return Form(
      key: keychangepass,
      child: ListView(
          children: [
            //appbar
            CustomeAppbarSidebar(texxt: "تغير كلمة السر",),
            SizedBox(height: screenSize.height*0.05,),
            //form
          Padding(
              padding:  EdgeInsets.only(right: screenSize.width*0.02,left: screenSize.width*0.02,top: screenSize.height*0.02),
              child: CustomeTextformfield(controller: oldpass,type: TextInputType.text, secure: BlocProvider.of<LoginCubit>(context).statee, ontap: (){
                BlocProvider.of<LoginCubit>(context).changeState();
              },textt: "كلمة السر القديمه",preicon: Icon(Icons.lock),suffixicon:Icons.visibility,),
            ),

            Padding(
              padding:  EdgeInsets.only(right: screenSize.width*0.02,left: screenSize.width*0.02,top: screenSize.height*0.05),
              child: CustomeTextformfield(controller: newpass,type: TextInputType.text, secure: BlocProvider.of<LoginCubit>(context).statee, ontap: (){
                BlocProvider.of<LoginCubit>(context).changeState();
              },textt: "كلمة السر الجديده",preicon: Icon(Icons.lock),suffixicon:Icons.visibility,),
            ),

            Padding(
              padding:  EdgeInsets.only(right: screenSize.width*0.02,left: screenSize.width*0.02,top: screenSize.height*0.05),
              child: CustomeTextformfield(controller: confirmnewpass,type: TextInputType.text, secure: BlocProvider.of<LoginCubit>(context).statee, ontap: (){
                BlocProvider.of<LoginCubit>(context).changeState();
              },textt: " تاكيد كلمة السر الجديده",preicon: Icon(Icons.lock),suffixicon:Icons.visibility,),
            ),

            //button
           confirmnewpass.text.isEmpty? Container():CustomeElevatedBustton(ontap: (){
             keychangepass.currentState!.validate();
           },textt: "تغير كلمة السر",)
          ],
        ),
    );
  },
),
    ),
);
  }
}
