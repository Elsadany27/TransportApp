import 'package:flutter/material.dart';

abstract class HomeState{}
//change color and text
class ChangeState extends HomeState{}
class UnchangeState extends HomeState{}

//chnage image
class DisplayImage extends HomeState{}
class IsloadingImage extends HomeState{}
class NormalImage extends HomeState{}