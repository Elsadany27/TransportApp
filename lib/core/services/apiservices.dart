
import 'package:trasportation/features/home/data/model/model.dart';

class DriverService {
  Future<int?> authenticateAndFetchDriverId(String email, String password)async {}
  Future<String?> getTokenResetPass(String email)async{}
  Future<String?> resetPassword({required String email,required String password})async{}
  Future<RouteModel?> getRouteDriver(email,pass)async{}
}