import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trasportation/core/utilities/app_images.dart';
import 'package:trasportation/features/home/presentation/view%20model/homecubit.dart';
import 'package:trasportation/features/home/presentation/view%20model/homestate.dart';

class CustomeCircleAvatar extends StatelessWidget {
  CustomeCircleAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: screenSize.width * 0.006, color: Colors.orange),
        ),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is IsloadingImage) {
              return CircleAvatar(
                child: CircularProgressIndicator(),
                radius: 30,
              );
            } else if (state is DisplayImage) {
              final urlImage = BlocProvider.of<HomeCubit>(context).urlimage;
              if (urlImage == null) {
                return CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(Assets.admin),
                );
              } else {
                return CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(urlImage),
                );
              }
            } else {
              return CircleAvatar(
                backgroundImage: AssetImage(Assets.admin),
                radius: 30,
              );
            }
          },
        ),
      ),
    );
  }
}
