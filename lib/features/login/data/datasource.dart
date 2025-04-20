// 2/3/2025
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:trasportation/core/services/apiservices.dart';

class DataSourceLogin extends DriverService {
  Dio _dio = Dio();
  String? token;

  // تسجيل دخول السائق
  @override
  Future<int?> authenticateAndFetchDriverId(String email, String password, context) async {
    int? driverId;
    String authUrl = "http://89.250.75.43:8077/web/session/authenticate";
    final Map<String, dynamic> authBody = {
      "jsonrpc": "2.0",
      "params": {
        "db": "Final_test2",
        "login": "admin",
        "password": "admin"
      }
    };

    try {
      final authResponse = await _dio.post(authUrl,
          data: jsonEncode(authBody),
          options: Options(headers: {"Content-Type": "application/json"}));

      print("استجابة المصادقة: ${authResponse.data}");

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
          print("❌ خطأ: لم يتم العثور على session_id في ملفات تعريف الارتباط");
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
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("البريد الإلكتروني أو كلمة المرور غير صحيحة")));
            print("❌ خطأ: لم يتم إرجاع driver_id في الاستجابة");
            return null;
          }
          print("✅ تسجيل دخول السائق ناجح: معرف السائق: $driverId");
        } else {
          print("❌ فشل تسجيل دخول السائق: ${driverResponse.statusCode} - ${driverResponse.data}");
        }
      } else {
        print("❌ فشل المصادقة: ${authResponse.statusCode} - ${authResponse.data}");
      }
    } catch (e) {
      if (e is DioError) {
        print("❌ خطأ Dio: ${e.response?.statusCode} - ${e.response?.data}");
      } else {
        print("❌ خطأ: $e");
      }
    }
    return driverId;
  }

  // طلب إعاد alloy تعيين كلمة المرور
  @override
  Future<String?> getTokenResetPass(String email) async {
    String authUrl = "http://89.250.75.43:8077/web/session/authenticate";
    final Map<String, dynamic> authBody = {
      "jsonrpc": "2.0",
      "params": {
        "db": "Final_test2",
        "login": "admin",
        "password": "admin"
      }
    };

    try {
      final authResponse = await _dio.post(authUrl,
          data: jsonEncode(authBody),
          options: Options(headers: {"Content-Type": "application/json"}));

      print("استجابة المصادقة: ${authResponse.data}");

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
          print("❌ خطأ: لم يتم العثور على session_id في ملفات تعريف الارتباط");
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
            print("❌ خطأ: لم يتم إرجاع رمز في الاستجابة");
            return null;
          }
          print("✅ نجاح: الرمز: $token");
        } else {
          print("❌ فشل طСсылка إعادة تعيين كلمة المرور: ${ResetPassResponse.statusCode} - ${ResetPassResponse.data}");
        }
      } else {
        print("❌ فشل: ${authResponse.statusCode} - ${authResponse.data}");
      }
    } catch (e) {
      if (e is DioError) {
        print("❌ خطأ Dio: ${e.response?.statusCode} - ${e.response?.data}");
      } else {
        print("❌ خطأ: $e");
      }
    }
    return token;
  }

  // إعادة تعيين كلمة المرور
  @override
  Future<String?> resetPassword({required String email, required String password}) async {
    String? ttoken = await getTokenResetPass(email);
    String? message;
    String authUrl = "http://89.250.75.43:8077/web/session/authenticate";
    final Map<String, dynamic> authBody = {
      "jsonrpc": "2.0",
      "params": {
        "db": "Final_test2",
        "login": "admin",
        "password": "admin"
      }
    };

    try {
      final authResponse = await _dio.post(authUrl,
          data: jsonEncode(authBody),
          options: Options(headers: {"Content-Type": "application/json"}));

      print("استجابة المصادقة: ${authResponse.data}");

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
          print("❌ خطأ: لم يتم العثور على session_id في ملفات تعريف الارتباط");
          return null;
        }

        final String driverLoginUrl = "http://89.250.75.43:8077/driver/reset-password";
        final Map<String, dynamic> ResetPassword = {
          "token": ttoken, // تأكد من أن هذا الرمز صالح
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

        print("استجابة إعادة تعيين كلمة المرور: ${ResetPassResponse.data}"); // تصحيح الأخطاء

        if (ResetPassResponse.statusCode == 200) {
          final driverData = ResetPassResponse.data;
          message = driverData['result']['message']; // استرجاع الرسالة بنجاح
          if (message == null) {
            String errorReason = driverData['error']?['message'] ?? "حدث خطأ غير معروف"; // تحسين معالجة الأخطاء
            print("❌ فشل إعادة تعيين كلمة المرور: $errorReason");
            return null;
          }
          print("✅ رسالة إعادة تعيين كلمة المرور: $message");
        } else {
          print("❌ فشل طلب إعادة تعيين كلمة المرور: ${ResetPassResponse.statusCode} - ${ResetPassResponse.data}");
        }
      } else {
        print("❌ فشل: ${authResponse.statusCode} - ${authResponse.data}");
      }
    } catch (e) {
      if (e is DioError) {
        print("❌ خطأ Dio: ${e.response?.statusCode} - ${e.response?.data}");
      } else {
        print("❌ خطأ: $e");
      }
    }
    return message;
  }
}