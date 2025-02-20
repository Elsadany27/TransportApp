import 'package:flutter/material.dart';

import '../../../../../core/utilities/app_images.dart';
import '../../../../login/presentation/view/loginpage.dart';

class SpalshScreenBody extends StatefulWidget {
  const SpalshScreenBody({super.key});

  @override
  State<SpalshScreenBody> createState() => _SpalshScreenBodyState();
}

class _SpalshScreenBodyState extends State<SpalshScreenBody> with SingleTickerProviderStateMixin{
  late AnimationController _animationController;
  @override
  void initState() {
    _animationController=AnimationController(vsync: this,duration: Duration(seconds: 3),lowerBound: 0.1,upperBound: 0.9);
    _animationController.forward();
    Future.delayed(Duration(seconds: 5),() {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => LoginPage(),), (route) => false,);
    },);
  }
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.black,
        body: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) =>Center(
      child: AnimatedOpacity(
          child: Image.asset(Assets.logo,height:screenSize.height*0.27),
          opacity: _animationController.value, duration: Duration(seconds: 3)),
    ),
    ));
  }
}
