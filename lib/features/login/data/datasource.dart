// import 'dart:convert';
// import 'package:dio/dio.dart';
// import 'package:trasportation/core/services/apiservices.dart';
//
// class DataSource extends DriverService {
//   Dio _dio = Dio();
//   String? token;
//
//   // Login driver
//   @override
//   Future<int?> authenticateAndFetchDriverId(String email, String password) async {
//     int? driverId; // Allow null assignment for driverId
//     String authUrl = "http://89.250.75.43:8077/web/session/authenticate";
//     final Map<String, dynamic> authBody = {
//       "jsonrpc": "2.0",
//       "params": {
//         "db": "Final_test",
//         "login": "admin",
//         "password": "admin"
//       }
//     };
//
//     try {
//       // Send authentication request
//       final authResponse = await _dio.post(authUrl,
//           data: jsonEncode(authBody),
//           options: Options(headers: {"Content-Type": "application/json"}));
//
//       // Print the full authentication response for debugging
//       print("Authentication Response: ${authResponse.data}");
//
//       // Check if request was successful
//       if (authResponse.statusCode == 200) {
//         // Get cookies from the response headers
//         String? sessionId;
//         List<String>? cookies = authResponse.headers['set-cookie'];
//
//         // If there are cookies, find the session_id
//         if (cookies != null) {
//           for (var cookie in cookies) {
//             if (cookie.startsWith("session_id=")) {
//               sessionId = cookie.split("=")[1].split(";")[0]; // Get the value of session_id
//               break;
//             }
//           }
//         }
//
//         // Check if session_id is successfully obtained
//         if (sessionId == null) {
//           print("❌ Error: No session_id found in cookies");
//           return null; // return null if no session_id is found
//         }
//
//         // Proceed to driver login if session_id is obtained
//         final String driverLoginUrl = "http://89.250.75.43:8077/driver/login";
//         final Map<String, dynamic> driverLoginBody = {
//           "email": email,
//           "password": password,
//         };
//
//         // Log in as the driver
//         final driverResponse = await _dio.post(driverLoginUrl,
//             data: jsonEncode(driverLoginBody),
//             options: Options(
//               headers: {
//                 "Content-Type": "application/json",
//                 "Cookie": "session_id=$sessionId",
//               },
//             ));
//
//         // Handle driver login response
//         if (driverResponse.statusCode == 200) {
//           final driverData = driverResponse.data;
//
//           // Check for driver ID
//           driverId = driverData['result']?['data']?['driver_id'];
//           if (driverId == null) {
//             print("❌ Error: No driver_id returned in response");
//             return null; // return null if no driver_id is found
//           }
//           print("✅ Driver login successful: Driver ID: $driverId");
//         } else {
//           print("❌ Driver login failed: ${driverResponse.statusCode} - ${driverResponse.data}");
//         }
//       } else {
//         print("❌ Authentication failed: ${authResponse.statusCode} - ${authResponse.data}");
//       }
//     } catch (e) {
//       if (e is DioError) {
//         print("❌ DioError: ${e.response?.statusCode} - ${e.response?.data}");
//       } else {
//         print("❌ Error: $e");
//       }
//     }
//     return driverId; // Return the driverId at the end
//   }
//
//
//   //request for reset pass
// @override
//   Future<String?> getTokenResetPass(String email) async{
//
//   String authUrl = "http://89.250.75.43:8077/web/session/authenticate";
//   final Map<String, dynamic> authBody = {
//     "jsonrpc": "2.0",
//     "params": {
//       "db": "Final_test",
//       "login": "admin",
//       "password": "admin"
//     }
//   };
//
//   try {
//     // Send authentication request
//     final authResponse = await _dio.post(authUrl,
//         data: jsonEncode(authBody),
//         options: Options(headers: {"Content-Type": "application/json"}));
//
//     // Print the full authentication response for debugging
//     print("Authentication Response: ${authResponse.data}");
//
//     // Check if request was successful
//     if (authResponse.statusCode == 200) {
//       // Get cookies from the response headers
//       String? sessionId;
//       List<String>? cookies = authResponse.headers['set-cookie'];
//
//       // If there are cookies, find the session_id
//       if (cookies != null) {
//         for (var cookie in cookies) {
//           if (cookie.startsWith("session_id=")) {
//             sessionId = cookie.split("=")[1].split(";")[0]; // Get the value of session_id
//             break;
//           }
//         }
//       }
//
//       // Check if session_id is successfully obtained
//       if (sessionId == null) {
//         print("❌ Error: No session_id found in cookies");
//         return null; // return null if no session_id is found
//       }
//
//       // Proceed to driver login if session_id is obtained
//       final String driverLoginUrl = "http://89.250.75.43:8077/driver/request-reset";
//       final Map<String, dynamic> ResetPassword = {
//         "email": email,
//       };
//
//       // Log in as the driver
//       final ResetPassResponse = await _dio.post(driverLoginUrl,
//           data: jsonEncode(ResetPassword),
//           options: Options(
//             headers: {
//               "Content-Type": "application/json",
//               "Cookie": "session_id=$sessionId",
//             },
//           ));
//
//       // Handle driver login response
//       if (ResetPassResponse.statusCode == 200) {
//         final driverData = ResetPassResponse.data;
//
//         // Check for driver ID
//         email=email;
//         token = driverData['result']?['data']?['token'];
//         if (token == null) {
//           print("❌ Error: No token returned in response");
//           return null; // return null if no driver_id is found
//         }
//         print("✅ successful: token: $token");
//       } else {
//         print("❌Request Reset Password failed: ${ResetPassResponse.statusCode} - ${ResetPassResponse.data}");
//       }
//     } else {
//       print("❌ failed: ${authResponse.statusCode} - ${authResponse.data}");
//     }
//   } catch (e) {
//     if (e is DioError) {
//       print("❌ DioError: ${e.response?.statusCode} - ${e.response?.data}");
//     } else {
//       print("❌ Error: $e");
//     }
//   }
//   return token; // Return the driverId at the end
//   }
//
//   //reset password
// @override
//   resetPassword({required String email,required String password})async {
//     String? message;
//   String authUrl = "http://89.250.75.43:8077/web/session/authenticate";
//   final Map<String, dynamic> authBody = {
//     "jsonrpc": "2.0",
//     "params": {
//       "db": "Final_test",
//       "login": "admin",
//       "password": "admin"
//     }
//   };
//
//   try {
//     // Send authentication request
//     final authResponse = await _dio.post(authUrl,
//         data: jsonEncode(authBody),
//         options: Options(headers: {"Content-Type": "application/json"}));
//
//     // Print the full authentication response for debugging
//     print("Authentication Response: ${authResponse.data}");
//
//     // Check if request was successful
//     if (authResponse.statusCode == 200) {
//       // Get cookies from the response headers
//       String? sessionId;
//       List<String>? cookies = authResponse.headers['set-cookie'];
//
//       // If there are cookies, find the session_id
//       if (cookies != null) {
//         for (var cookie in cookies) {
//           if (cookie.startsWith("session_id=")) {
//             sessionId = cookie.split("=")[1].split(";")[0]; // Get the value of session_id
//             break;
//           }
//         }
//       }
//
//       // Check if session_id is successfully obtained
//       if (sessionId == null) {
//         print("❌ Error: No session_id found in cookies");
//         return null; // return null if no session_id is found
//       }
//
//       // Proceed to driver login if session_id is obtained
//       final String driverLoginUrl = "http://89.250.75.43:8077/driver/reset-password";
//       final Map<String, dynamic> ResetPassword = {
//         "token":token,
//         "email":email,
//         "new_password":password
//       };
//
//       // Log in as the driver
//       final ResetPassResponse = await _dio.post(driverLoginUrl,
//           data: jsonEncode(ResetPassword),
//           options: Options(
//             headers: {
//               "Content-Type": "application/json",
//               "Cookie": "session_id=$sessionId",
//             },
//           ));
//
//       // Handle driver login response
//       if (ResetPassResponse.statusCode == 200) {
//         final driverData = ResetPassResponse.data;
//
//         // message
//         message = driverData['result']['message'];
//         if (token == null) {
//           print("❌ Error: No message returned in response");
//           return null; // return null if no driver_id is found
//         }
//         print("✅ successful: message: $message");
//       } else {
//         print("❌Request Reset Password failed: ${ResetPassResponse.statusCode} - ${ResetPassResponse.data}");
//       }
//     } else {
//       print("❌ failed: ${authResponse.statusCode} - ${authResponse.data}");
//     }
//   } catch (e) {
//     if (e is DioError) {
//       print("❌ DioError: ${e.response?.statusCode} - ${e.response?.data}");
//     } else {
//       print("❌ Error: $e");
//     }
//   }
//   return message; // Return the driverId at the end
// }
//
// }


//2/3/2025
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:trasportation/core/services/apiservices.dart';

class DataSourceLogin extends DriverService {
  Dio _dio = Dio();
  String? token;

  // Login driver
  @override
  Future<int?> authenticateAndFetchDriverId(String email, String password) async {
    int? driverId;
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
      final authResponse = await _dio.post(authUrl,
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

        final String driverLoginUrl = "http://89.250.75.43:8077/driver/login";
        final Map<String, dynamic> driverLoginBody = {
          "email": email,
          "password": password,
        };

        final driverResponse = await _dio.post(driverLoginUrl,
            data: jsonEncode(driverLoginBody),
            options: Options(
              headers: {
                "Content-Type": "application/json",
                "Cookie": "session_id=$sessionId",
              },
            ));

        if (driverResponse.statusCode == 200) {
          final driverData = driverResponse.data;
          driverId = driverData['result']?['data']?['driver_id'];
          if (driverId == null) {
            print("❌ Error: No driver_id returned in response");
            return null;
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
    return driverId;
  }

  // Request for reset password
  @override
  Future<String?> getTokenResetPass(String email) async {
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
      final authResponse = await _dio.post(authUrl,
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

        final String driverLoginUrl = "http://89.250.75.43:8077/driver/request-reset";
        final Map<String, dynamic> ResetPassword = {
          "email": email,
        };

        final ResetPassResponse = await _dio.post(driverLoginUrl,
            data: jsonEncode(ResetPassword),
            options: Options(
              headers: {
                "Content-Type": "application/json",
                "Cookie": "session_id=$sessionId",
              },
            ));

        if (ResetPassResponse.statusCode == 200) {
          final driverData = ResetPassResponse.data;
          token = driverData['result']?['data']['token'];
          if (token == null) {
            print("❌ Error: No token returned in response");
            return null;
          }
          print("✅ successful: token: $token");
        } else {
          print("❌ Request Reset Password failed: ${ResetPassResponse.statusCode} - ${ResetPassResponse.data}");
        }
      } else {
        print("❌ failed: ${authResponse.statusCode} - ${authResponse.data}");
      }
    } catch (e) {
      if (e is DioError) {
        print("❌ DioError: ${e.response?.statusCode} - ${e.response?.data}");
      } else {
        print("❌ Error: $e");
      }
    }
    return token;
  }

  // Reset password
  @override
  Future<String?> resetPassword({required String email, required String password}) async {
    String? ttoken=await getTokenResetPass(email);
    String? message;
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
      final authResponse = await _dio.post(authUrl,
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

        final String driverLoginUrl = "http://89.250.75.43:8077/driver/reset-password";
        final Map<String, dynamic> ResetPassword = {
          "token": ttoken,  // Make sure this token is valid
          "email": email,
          "new_password": password
        };

        final ResetPassResponse = await _dio.post(driverLoginUrl,
            data: jsonEncode(ResetPassword),
            options: Options(
              headers: {
                "Content-Type": "application/json",
                "Cookie": "session_id=$sessionId",
              },
            ));

        print("Reset Password Response: ${ResetPassResponse.data}"); // Debugging

        if (ResetPassResponse.statusCode == 200) {
          final driverData = ResetPassResponse.data;
          message = driverData['result']['message']; // Successfully retrieve this message
          if (message == null) {
            String errorReason = driverData['error']?['message'] ?? "Unknown error occurred"; // Improved error handling
            print("❌ Reset Password failed: $errorReason");
            return null;
          }
          print("✅ Password reset message: $message");
        } else {
          print("❌ Request Reset Password failed: ${ResetPassResponse.statusCode} - ${ResetPassResponse.data}");
        }
      } else {
        print("❌ failed: ${authResponse.statusCode} - ${authResponse.data}");
      }
    } catch (e) {
      if (e is DioError) {
        print("❌ DioError: ${e.response?.statusCode} - ${e.response?.data}");
      } else {
        print("❌ Error: $e");
      }
    }
    return message;
  }
}