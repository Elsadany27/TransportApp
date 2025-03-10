// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../data/data.dart';
// import '../../view model/homecubit.dart';
// import '../../view model/homestate.dart'; // Assuming StepsData is imported from here
//
// class CustomeStepper extends StatefulWidget {
//   const CustomeStepper({super.key});
//
//   @override
//   State<CustomeStepper> createState() => _CustomeStepperState();
// }
//
// class _CustomeStepperState extends State<CustomeStepper> {
//   int currentStep = 0;
//   List<StepsData> data = [
//     StepsData(name: "البدايه", subtitle: "رمسيس"),
//     StepsData(name: "العباسيه", subtitle: "العباسيه"),
//     StepsData(name: "محور المشير", subtitle: "محور المشير"),
//     StepsData(name: "التجمع الخامس", subtitle: "التجمع الخامس"),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     final screenSize = MediaQuery.of(context).size;
//
//     return Center(
//       child: Stepper(
//         elevation: 30,
//         currentStep: currentStep,
//         onStepTapped: (int step) {
//           setState(() {
//             currentStep = step;
//           });
//         },
//         onStepContinue: () {
//           // If we are on the last step, change the button text to "انهاء الشيفت"
//           if (currentStep < data.length - 1) {
//             setState(() {
//               currentStep++;
//             });
//           } else {
//             // When on the last step, update the state to "انهاء الشيفت" and perform the required actions
//             BlocProvider.of<HomeCubit>(context).changeText();
//             var timee = DateTime.now();
//             showDialog(
//               context: context,
//               builder: (context) => Center(
//                 child: AlertDialog(
//                   elevation: 25,
//                   shadowColor: Colors.black,
//                   title: Center(
//                     child: Text("شكرا لك  \n $timee"),
//                   ),
//                 ),
//               ),
//             );
//           }
//         },
//         onStepCancel: () {
//           if (currentStep > 0) {
//             setState(() {
//               currentStep--;
//             });
//           }
//         },
//         steps: data.map((stepData) {
//           return Step(
//             title: Text(stepData.name.toString()),
//             subtitle: Text(stepData.subtitle.toString()),
//             content: currentStep == 0 || currentStep == data.length - 1
//                 ? BlocConsumer<HomeCubit, HomeState>(
//               listener: (context, state) {},
//               builder: (context, state) {
//                 // Show the button for all steps except the last one
//                 if (currentStep < data.length - 1) {
//                   return MaterialButton(
//                     color: BlocProvider.of<HomeCubit>(context).color,
//                     onPressed: () {
//                       BlocProvider.of<HomeCubit>(context).changeText();
//                       var timee = DateTime.now();
//                       if (BlocProvider.of<HomeCubit>(context).text ==
//                           "انهاء الشيفت") {
//                         showDialog(
//                           context: context,
//                           builder: (context) => Center(
//                             child: AlertDialog(
//                               elevation: 25,
//                               shadowColor: Colors.black,
//                               title: Center(
//                                   child: Text("لقد بدات \n $timee")),
//                             ),
//                           ),
//                         );
//                       } else {
//                         showDialog(
//                           context: context,
//                           builder: (context) => Center(
//                             child: AlertDialog(
//                               elevation: 25,
//                               shadowColor: Colors.black,
//                               title: Center(
//                                   child: Text("شكرا لك  \n $timee")),
//                             ),
//                           ),
//                         );
//                       }
//                     },
//                     elevation: 25,
//                     shape: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(15)),
//                     child: Text(
//                       "${BlocProvider.of<HomeCubit>(context).text}",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                         fontSize: screenSize.width * 0.04,
//                       ),
//                     ),
//                   );
//                 } else {
//                   // On the last step, only show the message without the button
//                   return Text('لقد وصلت الى ${stepData.name}');
//                 }
//               },
//             )
//                 : Text('لقد وصلت الى ${stepData.name}'),
//             isActive: currentStep >= 0,
//             state: currentStep > data.indexOf(stepData)
//                 ? StepState.complete
//                 : StepState.disabled,
//           );
//         }).toList(),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/data.dart';
import '../../../data/model/routes_model.dart';
import '../../view model/homecubit/homecubit.dart';

class CustomeStepper extends StatefulWidget {
  final RouteModel routeData;

  const CustomeStepper({super.key, required this.routeData});

  @override
  State<CustomeStepper> createState() => _CustomeStepperState();
}

class _CustomeStepperState extends State<CustomeStepper> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final steps = widget.routeData.result?.data?.routes?.first.route?.points ?? [];

    if (steps.isEmpty) {
      return Center(child: Text("ليس هناك خط سير اليوم"));
    }

    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Center(
        child: Stepper(
          elevation: 30,
          currentStep: currentStep.clamp(0, steps.length - 1),
          onStepTapped: (int step) {
            setState(() {
              currentStep = step.clamp(0, steps.length - 1);
            });
          },
          onStepContinue: () {
            if (currentStep < steps.length - 1) {
              setState(() {
                currentStep++;
              });
            } else {
              BlocProvider.of<HomeCubit>(context).changeText();
              var timee = DateTime.now();
              showDialog(
                context: context,
                builder: (context) => Center(
                  child: AlertDialog(
                    elevation: 25,
                    shadowColor: Colors.black,
                    title: Center(
                      child: Text("شكرا لك  \n $timee"),
                    ),
                  ),
                ),
              );
            }
          },
          onStepCancel: () {
            if (currentStep > 0) {
              setState(() {
                currentStep--;
              });
            }
          },
          steps: steps.map((point) {
            return Step(
              title: Text(point.toString()),
              content: Text('لقد وصلت الى ${point.toString()}'),
              isActive: currentStep >= 0,
              state: currentStep > steps.indexOf(point)
                  ? StepState.complete
                  : StepState.disabled,
            );
          }).toList(),
        ),
      ),
    );
  }
}
