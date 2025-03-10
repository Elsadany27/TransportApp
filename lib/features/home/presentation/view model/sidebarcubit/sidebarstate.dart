import '../../../data/model/payroll_driver_model.dart';

abstract class SideBarState{}

//payroll
class InitialState extends SideBarState{}
class IsloadingPyroll extends SideBarState{}
class SuccessPyroll extends SideBarState{
  PyrollDriverModel? data;
  SuccessPyroll({this.data});
}
class FailurePyroll extends SideBarState{
  String? errorMessage;
  FailurePyroll({this.errorMessage});
}