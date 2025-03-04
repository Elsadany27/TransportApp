import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trasportation/core/utilities/app_images.dart';
import 'package:trasportation/features/login/data/datasource.dart';
import 'package:trasportation/features/login/presentation/view model/logincubit.dart';
import 'package:trasportation/features/login/presentation/view model/loginstate.dart';
import 'package:trasportation/features/login/presentation/view/requestresetpassword.dart';
import 'package:trasportation/features/login/presentation/view/widgets/customeTextformfield.dart';
import '../../../../core/constant/CustomeElevatedBustton.dart';


class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> keyLogin = GlobalKey();
  final DataSourceLogin dataSource = DataSourceLogin();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        body: Form(
          key: keyLogin,
          child: Stack(children: [
              //first container
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(Assets.backgroundLogin),fit: BoxFit.fill)),
              ),

              //screen black
              Container(color: Colors.black45,),

              //content
              Padding(
                padding:EdgeInsets.only(right:screenSize.width*0.03,left: screenSize.width*0.03,top: screenSize.height*0.05 ),
                child: ListView(
                  children: [
                    // Logo
                    Image.asset(alignment: Alignment.topLeft,Assets.logo, height: screenSize.height * 0.20,),
                    SizedBox(height: screenSize.height * 0.05),
                    // Text
                    Text("اهلا بعودتك .. ", style: TextStyle(fontSize: screenSize.width * 0.06, fontWeight: FontWeight.bold,color: Colors.white), textDirection: TextDirection.rtl,),
                    Text("قم بتسجيل الدخول , لتبدا رحلتك", style: TextStyle(fontSize: screenSize.width * 0.045, fontWeight: FontWeight.w500, color: Colors.white60), textDirection: TextDirection.rtl,),
                    SizedBox(height: screenSize.height * 0.05),
                    // Form
                    CustomeTextformfield(type: TextInputType.text, ontap: () {}, secure: false, textt: "البريد الالكترونى",preicon: Icon(Icons.email_outlined,color: Colors.white,), controller: email,),
                    SizedBox(height: screenSize.height * 0.03),
                    BlocConsumer<LoginCubit, LoginState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        return CustomeTextformfield(
                          type: TextInputType.text,
                          ontap: () {
                            BlocProvider.of<LoginCubit>(context).changeState();
                          },
                          suffixicon: Icons.visibility_off,
                          secure: BlocProvider.of<LoginCubit>(context).statee,
                          textt: "كلمة السر",
                          preicon: Icon(Icons.lock_outline,color: Colors.white,),
                          controller: password,
                        );
                      },
                    ),

                    //forget pass
                    Container(alignment: Alignment.centerRight,child: TextButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => RequestResetPassword(),));}, child:Text("نسيت كلمة المرور..؟",style: TextStyle(color: Colors.white,fontSize: screenSize.width*0.035,fontWeight: FontWeight.w700),))),
                    // Button
                BlocBuilder<LoginCubit,LoginState>(builder: (context, state) {
                  if(state is IsLoadingState){
                   return CircleAvatar(radius: 25,child: CircularProgressIndicator(color: Colors.red,),backgroundColor: Colors.black,);
                  }
                  else{
                    return CustomeElevatedBustton(
                      color: Colors.black,
                      ontap: () async {

                        // if (keyLogin.currentState!.validate()) {
                        //   // Generate the current time in seconds
                        //   var currentTime = DateTime.now().millisecondsSinceEpoch ~/ 1000;
                        //   // Create the hash
                        //   var hashInput = 'AWM\$0011$currentTime';
                        //   var bytes = utf8.encode(hashInput);
                        //   var digest = md5.convert(bytes);
                        //
                        //   // Print the generated values (for debugging)
                        //   print('Time: $currentTime');
                        //   print('Signature: $digest');
                        //
                        //   // Await the token retrieval
                        //   String? accessToken = await dataSource.getCurrentLocation(
                        //     time: currentTime.toString(),
                        //     signature: digest.toString(),
                        //     account: email.text.trim()
                        //   );
                        //
                        //   if (accessToken != null) {
                        //     print('Access Token: $accessToken');
                        //     // Navigate to the QrScanPage after generating the token
                        //     Navigator.of(context).pushAndRemoveUntil(
                        //       MaterialPageRoute(builder: (context) => QrScaanPage()),
                        //           (route) => false,
                        //     );
                        //   } else {
                        //     print('Failed to retrieve access token.');
                        //   }
                        // }

                        BlocProvider.of<LoginCubit>(context).loggin(email: email.text.trim(), pass: password.text.trim(), context: context);

                      },
                      textt: "تسجيل الدخول",
                    );
                  }
                },)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}