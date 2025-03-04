import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:trasportation/core/services/apiservices.dart';
import 'package:trasportation/features/home/data/model/model.dart';
import 'package:trasportation/features/login/data/datasource.dart';

class HomeDataSource extends DriverService {
  Dio dio = Dio();
  RouteModel? routeData;
  int? idDriverr;
  @override
  getRouteDriver(email, pass) async {
    DataSourceLogin dataSourceLogin = DataSourceLogin();
     idDriverr = await dataSourceLogin.authenticateAndFetchDriverId(
        email, pass);
    String authUrl = "http://89.250.75.43:8077/web/session/authenticate";
    final Map<String, dynamic> authBody = {
      "jsonrpc": "2.0",
      "params": {
        "db": "Final_test",
        "login": "admin",
        "password": "admin"
      }
    };

    try {
      final authResponse = await dio.post(authUrl,
          data: jsonEncode(authBody),
          options: Options(headers: {"Content-Type": "application/json"}));
      print("Authentication Response: ${authResponse.data}");

      if (authResponse.statusCode == 200) {
        String? sessionId;
        List<String>? cookies = authResponse.headers['set-cookie'];

        if (cookies != null) {
          for (var cookie in cookies) {
            if (cookie.startsWith("session_id=")) {
              sessionId = cookie.split("=")[1].split(";")[0];
              break;
            }
          }
        }

        if (sessionId == null) {
          print("❌ Error: No session_id found in cookies");
          return null;
        }

        final String driverRouteUrl = "http://89.250.75.43:8077/driver/routes/$idDriverr";

final data={};
        final RouteResponse = await dio.get(driverRouteUrl,
            data:data ,
            options: Options(
              headers: {
                "Content-Type": "application/json",
                "Cookie": "session_id=$sessionId",
              },
            ));

        print("Route success: ${RouteResponse.data}"); // Debugging

        if (RouteResponse.statusCode == 200) {
          routeData = RouteModel.fromJson(RouteResponse.data);
        }
        return routeData;
      }
    }catch(e){
      print(e);
    }
  }
}


