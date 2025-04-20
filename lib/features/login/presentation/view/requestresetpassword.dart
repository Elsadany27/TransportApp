import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trasportation/core/constant/CustomeElevatedBustton.dart';
import 'package:trasportation/core/utilities/component/customeappbarSidebar.dart';
import 'package:trasportation/features/login/presentation/view%20model/logincubit.dart';
import 'package:trasportation/features/login/presentation/view%20model/loginstate.dart';
import 'package:trasportation/features/login/presentation/view/widgets/customeTextformfield.dart';

import '../../../../core/widgets/custome_loading_indicator.dart';

class RequestResetPassword extends StatelessWidget {
   RequestResetPassword({super.key});

   TextEditingController email=TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return BlocProvider(
  create: (context) => LoginCubit(),
  child: Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding:  EdgeInsets.only(right:screenSize.width*0.02,left: screenSize.width*0.02,top: screenSize.height*0.02 ),
        child: ListView(
          children: [
            //appbar
            CustomeAppbarSidebar(texxt: "تعديل كلمة المرور",color: Colors.white,),
            SizedBox(height: screenSize.height*0.06,),
            //field
            CustomeTextformfield(hintstyle: TextStyle(color: Colors.white),styleTextColor: Colors.white,borderColor: Colors.white38,type: TextInputType.emailAddress, secure: false, ontap: (){},textt: "البريد الالكترونى",preicon: Icon(Icons.email_outlined,color: Colors.white,),controller: email,),
            //button
            BlocBuilder<LoginCubit,LoginState>(builder: (context, state) {
              if(state is IsLoadingRequestPass){
                return const CustomeLoadingIndicator();
              }
              else if (state is FailureRequestPass){
                return Center(child: Text("There is fail,please try again"));
              }
              else {
               return CustomeElevatedBustton(ontap: (){
                 BlocProvider.of<LoginCubit>(context).requestResetPass(email.text.trim(),context);
               },textt: "التالى",color: Colors.white12,);
              }
            },)
          ],
        ),
      ),
    ),
);
  }
}
