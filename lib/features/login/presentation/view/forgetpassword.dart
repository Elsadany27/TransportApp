import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trasportation/core/constant/CustomeElevatedBustton.dart';
import 'package:trasportation/features/login/presentation/view%20model/loginstate.dart';
import 'package:trasportation/features/login/presentation/view/widgets/customeTextformfield.dart';

import '../../../../core/utilities/component/customeappbarSidebar.dart';
import '../../../../core/widgets/custome_loading_indicator.dart';
import '../view model/logincubit.dart';

class ForgetPassword extends StatelessWidget {
   ForgetPassword({super.key});

   TextEditingController password=TextEditingController();
   TextEditingController email=TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return BlocProvider(
  create: (context) => LoginCubit(),
  child: Scaffold(
      backgroundColor: Colors.black,
      body:ListView(children: [
        //appbar
        CustomeAppbarSidebar(texxt: "تعديل كلمة المرور",color: Colors.white,),
        SizedBox(height: screenSize.height*0.06,),
        //form
        Padding(
          padding:EdgeInsets.only(left: screenSize.width*0.03,right: screenSize.width*0.03),
          child: CustomeTextformfield(hintstyle: TextStyle(color: Colors.white),styleTextColor: Colors.white,borderColor: Colors.white38,type: TextInputType.emailAddress, secure: false, ontap: (){},textt: "البريد الالكترونى",preicon: Icon(Icons.email_outlined,color: Colors.white,),controller: email,),
        ),
SizedBox(height: screenSize.height*0.02,),
        Padding(
          padding: EdgeInsets.only(left: screenSize.width*0.03,right: screenSize.width*0.03),
          child: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {},
            builder: (context, state) {
              return CustomeTextformfield(
                hintstyle: TextStyle(color: Colors.white),styleTextColor: Colors.white,borderColor: Colors.white38,
                type: TextInputType.text,
                ontap: () {
                  BlocProvider.of<LoginCubit>(context).changeState();
                },
                suffixicon: Icons.visibility_off,
                secure: BlocProvider.of<LoginCubit>(context).statee,
                textt: "كلمة السر",
                preicon: Icon(Icons.lock_outline,color: Colors.white,),
                controller: password,
              );},
          ),),

        //button
        BlocBuilder<LoginCubit,LoginState>(builder: (context, state) {
          if(state is IsLoadingResetPassword){
            return const CustomeLoadingIndicator();
          }
          else if (state is FailureResetPassword){
            return Center(child: Text("There is fail,please try again"));
          }
          else{
            return CustomeElevatedBustton(ontap: (){
              BlocProvider.of<LoginCubit>(context).resetPassword(email:email.text.trim(),pass:password.text.trim(),context:context);
            },color: Colors.white12,textt: "تغير كلمة السر",);
          }
        },)
      ],) ,
    ),
);
  }
}
