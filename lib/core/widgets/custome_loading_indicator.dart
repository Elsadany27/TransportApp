import 'package:flutter/material.dart';

class CustomeLoadingIndicator extends StatelessWidget {
  const CustomeLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: Colors.black,
      child: CircularProgressIndicator(color: Colors.red,),
    );
  }
}
