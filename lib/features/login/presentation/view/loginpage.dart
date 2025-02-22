import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trasportation/core/utilities/app_images.dart';
import 'package:trasportation/features/login/presentation/view%20model/logincubit.dart';
import 'package:trasportation/features/login/presentation/view%20model/loginstate.dart';
import 'package:trasportation/features/login/presentation/view/qrScaanPage.dart';
import 'package:trasportation/features/login/presentation/view/widgets/customeTextformfield.dart';

import '../../../../core/constant/CustomeElevatedBustton.dart';

class LoginPage extends StatelessWidget {
   LoginPage({super.key});

   TextEditingController email=TextEditingController();
   TextEditingController password=TextEditingController();

   GlobalKey<FormState> keyLogin=GlobalKey();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return BlocProvider(
  create: (context) => LoginCubit(),
  child: Scaffold(
        body: Form(
          key: keyLogin,
          child: Padding(
            padding:  EdgeInsets.only(left: screenSize.width*0.02,right: screenSize.width*0.03,top: screenSize.height*0.05),
            child: ListView(
              children: [
                //logo
                Image.asset(Assets.logo,height: screenSize.height*0.20,),SizedBox(height: screenSize.height*0.04,),
                //text
                Text("اهلا بعودتك .. ",style: TextStyle(fontSize: screenSize.width*0.06,fontWeight: FontWeight.bold,),textDirection: TextDirection.rtl,),
                Text("قم بتسجيل الدخول , لتبدا رحلتك",style: TextStyle(fontSize: screenSize.width*0.045,fontWeight: FontWeight.w500,color: Colors.black87),textDirection: TextDirection.rtl),
                SizedBox(height: screenSize.height*0.05,),
                //form
                CustomeTextformfield(type: TextInputType.text,ontap: (){},secure: false,textt: "البريد الالكترونى",preicon: Icon(Icons.email_outlined),controller: email,),SizedBox(height: screenSize.height*0.03,),
                  BlocConsumer<LoginCubit, LoginState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                      return CustomeTextformfield(type: TextInputType.text,ontap: (){
                        BlocProvider.of<LoginCubit>(context).changeState();
                      },
                        suffixicon: Icons.visibility_off,
                        secure: BlocProvider.of<LoginCubit>(context).statee,
                        textt: "كلمة السر",preicon: Icon(Icons.lock_outline),controller: password,);
            },
          ),
                //button
                CustomeElevatedBustton(ontap: (){
                  keyLogin.currentState!.validate();
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => QrScaanPage(),), (route) => false,);
                },textt: "تسجيل الدخول",)

              ],
            ),
          ),
        ),
    ),
);
  }
}
