
import 'package:trasportation/features/home/data/model/driver_model.dart';
import 'package:trasportation/features/home/data/model/payroll_driver_model.dart';
import 'package:trasportation/features/home/data/model/routes_model.dart';

class DriverService {
  Future<int?> authenticateAndFetchDriverId(String email, String password,context)async {}
  Future<String?> getTokenResetPass(String email)async{}
  Future<String?> resetPassword({required String email,required String password})async{}
  Future<RouteModel?> getRouteDriver(email,pass,context)async{}
  Future<DriverModel?> getDriverInfo(email,pass,context)async{}
  Future<PyrollDriverModel?> getPayrollDriver(email,pass,context)async{}
}