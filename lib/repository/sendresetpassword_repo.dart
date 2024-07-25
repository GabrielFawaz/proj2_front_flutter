











import 'dart:convert';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import '../models/app_response.dart';
import '../providers/api_provider.dart';

/*
class SendResetPasswordRepo extends GetxService{

  APIProvider apiProvider=Get.find<APIProvider>();

  static List<String>? cookies;

  Future<AppResponse<String>> resetpassword(String username) async {
    try {
      dio.Response response = await apiProvider.postRequest(
        "${APIProvider.url}password/email",
        {},
        jsonEncode({
          "email": username,
        }),
      );

      cookies =response.headers['set-cookie'];

      print("Response status code: ${response.statusCode}");
      print("Response body: ${response.data}");
      print("Response token: ${response.data["token"]}");
      print("Response cookies: ${response.data["Cookies"]}");
      print("Response cookies: ${cookies}");



      if (response.statusCode == 200) {
        if (response.data != null && response.data["token"] != null) {
          return AppResponse<String>(
            success: true,
            data: response.data["token"],
          );
        } else {
          throw Exception("Token not found in response data");
        }
      } else {
        throw Exception("Server responded with status code ${response.statusCode}");
      }
    } on dio.DioError catch (e) {
      print("Dio error during reset password: $e");
      print("Dio error type: ${e.type}");
      print("Dio error message: ${e.message}");
      if (e.response != null) {
        print("Dio response status code: ${e.response!.statusCode}");
        print("Dio response data: ${e.response!.data}");
      }
      String errorMessage = "Network error occurred";
      if (e.response != null) {
        errorMessage = "Server error: ${e.response!.statusCode}";
      }
      return AppResponse(success: false, errorMessage: errorMessage);
    } catch (e) {
      print("Error during reset password: $e");
      return AppResponse(success: false, errorMessage: e.toString());
    }
  }
}
*/



class SendResetPasswordRepo extends GetxService {
  APIProvider apiProvider = Get.find<APIProvider>();
  static List<String>? cookies;

  Future<AppResponse<String>> resetpassword(String username) async {
    try {
      dio.Response response = await apiProvider.postRequest(
        "${APIProvider.url}password/email",
        {},
        jsonEncode({
          "email": username,
        }),
      );

      cookies = response.headers['set-cookie'];

      print("Response status code: ${response.statusCode}");
      print("Response body: ${response.data}");
      print("Response cookies: ${cookies}");

      if (response.statusCode == 200) {
        return AppResponse<String>(
          success: true,
          data: "Reset password email sent",
        );
      } else {
        throw Exception("Server responded with status code ${response.statusCode}");
      }
    } on dio.DioError catch (e) {
      print("Dio error during reset password: $e");
      print("Dio error type: ${e.type}");
      print("Dio error message: ${e.message}");
      if (e.response != null) {
        print("Dio response status code: ${e.response!.statusCode}");
        print("Dio response data: ${e.response!.data}");
      }
      String errorMessage = "Network error occurred";
      if (e.response != null) {
        errorMessage = "Server error: ${e.response!.statusCode}";
      }
      return AppResponse(success: false, errorMessage: errorMessage);
    } catch (e) {
      print("Error during reset password: $e");
      return AppResponse(success: false, errorMessage: e.toString());
    }
  }
}







/*
  Future<AppResponse<String>> resetpassword(String username) async {
    try {
      dio.Response response = await apiProvider.postRequest(
        "http://127.0.0.1:8000/api/password/email",
        {},
        jsonEncode({
          "email": username,
        }),
      );
      print("Response status code: ${response.statusCode}");
      print("Response body: ${response.data}");

      if (response.statusCode == 200) {
        if (response.data != null && response.data["token"] != null) {
          return AppResponse<String>(
            success: true,
            data: response.data["token"],
          );
        } else {
          throw Exception("Token not found in response data");
        }
      } else {
        throw Exception("Server responded with status code ${response.statusCode}");
      }
    } on dio.DioError catch (e) {
      print("Dio error during login: $e");
      String errorMessage = "Network error occurred";
      if (e.response != null) {
        errorMessage = "Server error: ${e.response!.statusCode}";
        // Optionally, handle different types of Dio errors (e.g., timeouts, connectivity issues)
      }
      return AppResponse(success: false, errorMessage: errorMessage);
    } catch (e) {
      print("Error during login: $e");
      return AppResponse(success: false, errorMessage: e.toString());
    }
  }
*/