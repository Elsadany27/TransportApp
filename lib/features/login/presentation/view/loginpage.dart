import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trasportation/core/utilities/app_images.dart';
import 'package:trasportation/features/login/data/datasource.dart';
import 'package:trasportation/features/login/presentation/view%20model/logincubit.dart';
import 'package:trasportation/features/login/presentation/view%20model/loginstate.dart';
import 'package:trasportation/features/login/presentation/view/requestresetpassword.dart';
import 'package:trasportation/features/login/presentation/view/widgets/customeTextformfield.dart';
import '../../../../core/constant/CustomeElevatedBustton.dart';
import '../../../../core/widgets/custome_loading_indicator.dart';

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
          child: Stack(
            children: [
              // Background
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Assets.backgroundLogin),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              // Dark overlay
              Container(color: Colors.black45),
              // Content
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenSize.width * 0.03,
                  vertical: screenSize.height * 0.05,
                ),
                child: ListView(
                  children: [
                    Image.asset(Assets.logo, height: screenSize.height * 0.20, alignment: Alignment.topLeft,),
                    SizedBox(height: screenSize.height * 0.05),
                    Text("اهلا بعودتك .. ", style: TextStyle(fontSize: screenSize.width * 0.06, fontWeight: FontWeight.bold, color: Colors.white,), textDirection: TextDirection.rtl,),
                    Text("قم بتسجيل الدخول , لتبدا رحلتك", style: TextStyle(fontSize: screenSize.width * 0.045, fontWeight: FontWeight.w500,color: Colors.white60,), textDirection: TextDirection.rtl,),
                    SizedBox(height: screenSize.height * 0.05),

                    // Email Field
                    CustomeTextformfield(controller: email, textt: "البريد الالكترونى", type: TextInputType.emailAddress, secure: false, ontap: () {}, preicon: Icon(Icons.email_outlined, color: Colors.white), borderColor: Colors.white38, hintstyle: TextStyle(color: Colors.white), styleTextColor: Colors.white,),
                    SizedBox(height: screenSize.height * 0.03),

                    // Password Field with visibility toggle
                    BlocBuilder<LoginCubit, LoginState>(
                      buildWhen: (previous, current) =>
                      current is VisabilityState || current is UnvisabilityState,
                      builder: (context, state) {
                        final cubit = context.read<LoginCubit>();
                        return CustomeTextformfield(controller: password, textt: "كلمة السر", type: TextInputType.text, secure: cubit.statee, ontap: cubit.changeState,
                          suffixicon: cubit.statee ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                          preicon: Icon(Icons.lock, color: Colors.white),
                          borderColor: Colors.white38,
                          hintstyle: TextStyle(color: Colors.white),
                          styleTextColor: Colors.white,
                        );
                      },
                    ),

                    // Forgot Password
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => RequestResetPassword(),));},
                        child: Text("نسيت كلمة المرور..؟", style: TextStyle(color: Colors.white, fontSize: screenSize.width * 0.035, fontWeight: FontWeight.w700,),),),),

                    // Login Button
                    BlocBuilder<LoginCubit, LoginState>(
                      buildWhen: (previous, current) => current is IsLoadingState || current is SuccessState || current is FailureState,
                      builder: (context, state) {
                        if (state is IsLoadingState) {
                          return Center(child: CustomeLoadingIndicator());
                        }
                        return CustomeElevatedBustton(color: Colors.black, textt: "تسجيل الدخول",
                          ontap: () {
                            if (keyLogin.currentState!.validate()) {
                              BlocProvider.of<LoginCubit>(context).loggin(email: email.text.trim(), pass: password.text.trim(), context: context,);
                            }
                          },
                        );
                      },
                    ),
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
