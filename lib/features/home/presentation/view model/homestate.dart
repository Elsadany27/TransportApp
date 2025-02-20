import 'package:flutter/material.dart';

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