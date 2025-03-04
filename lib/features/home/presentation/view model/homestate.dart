import 'package:flutter/material.dart';
import 'package:trasportation/features/home/data/model/model.dart';

abstract class HomeState{}
//change color and text
class ChangeState extends HomeState{}
class UnchangeState extends HomeState{}

//chnage image
class IsloadingImage extends HomeState {}

class DisplayImage extends HomeState {}

class FailureState extends HomeState {
  final String error;
  FailureState({required this.error});
}
class InitialState extends HomeState{}

//route
class IsloadingRoute extends HomeState{}
class SuccessRoute extends HomeState{
  RouteModel? data;
  SuccessRoute({required this.data});
}
class FailureRoute extends HomeState{
  String? errorMessage;
  FailureRoute({required this.errorMessage});
}