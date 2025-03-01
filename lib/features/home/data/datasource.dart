import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:trasportation/core/services/apiservices.dart';

class DataSource extends DriverService {
  Dio _dio = Dio();

  // Login driver
  @override
  Future<int?> authenticateAndFetchDriverId(String email, String password) async {
    int? driverId; // Allow null assignment for driverId
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
      // Send authentication request
      final authResponse = await _dio.post(authUrl,
          data: jsonEncode(authBody),
          options: Options(headers: {"Content-Type": "application/json"}));

      // Print the full authentication response for debugging
      print("Authentication Response: ${authResponse.data}");

      // Check if request was successful
      if (authResponse.statusCode == 200) {
        // Get cookies from the response headers
        String? sessionId;
        List<String>? cookies = authResponse.headers['set-cookie'];

        // If there are cookies, find the session_id
        if (cookies != null) {
          for (var cookie in cookies) {
            if (cookie.startsWith("session_id=")) {
              sessionId = cookie.split("=")[1].split(";")[0]; // Get the value of session_id
              break;
            }
          }
        }

        // Check if session_id is successfully obtained
        if (sessionId == null) {
          print("❌ Error: No session_id found in cookies");
          return null; // return null if no session_id is found
        }

        // Proceed to driver login if session_id is obtained
        final String driverLoginUrl = "http://89.250.75.43:8077/driver/login";
        final Map<String, dynamic> driverLoginBody = {
          "email": email,
          "password": password,
        };

        // Log in as the driver
        final driverResponse = await _dio.post(driverLoginUrl,
            data: jsonEncode(driverLoginBody),
            options: Options(
              headers: {
                "Content-Type": "application/json",
                "Cookie": "session_id=$sessionId",
              },
            ));

        // Handle driver login response
        if (driverResponse.statusCode == 200) {
          final driverData = driverResponse.data;

          // Check for driver ID
          driverId = driverData['result']?['data']?['driver_id'];
          if (driverId == null) {
            print("❌ Error: No driver_id returned in response");
            return null; // return null if no driver_id is found
          }
          print("✅ Driver login successful: Driver ID: $driverId");
        } else {
          print("❌ Driver login failed: ${driverResponse.statusCode} - ${driverResponse.data}");
        }
      } else {
        print("❌ Authentication failed: ${authResponse.statusCode} - ${authResponse.data}");
      }
    } catch (e) {
      if (e is DioError) {
        print("❌ DioError: ${e.response?.statusCode} - ${e.response?.data}");
      } else {
        print("❌ Error: $e");
      }
    }
    return driverId; // Return the driverId at the end
  }
}