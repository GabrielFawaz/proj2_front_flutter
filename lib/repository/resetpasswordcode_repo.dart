import 'dart:convert';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import '../models/app_response.dart';
import '../providers/api_provider.dart';

class ResetPasswordCodeRepo extends GetxService {
  static List<String>? cookies;
  APIProvider apiProvider = Get.find<APIProvider>();

  Future<AppResponse<String>> resetpasswordcode(String email, String password ,String confirmation,String code) async {
    try {
      dio.Response response = await apiProvider.postRequest(
        "${APIProvider.url}password/reset",
        {},
        jsonEncode({
          "email": email,
          "password": password,
          "password_confirmation": confirmation,
          "code": code,
        }),
      );

      cookies = response.headers['set-cookie'];

      print("Response status code: ${response.statusCode}");
      print("Response body: ${response.data}");

      if (response.statusCode == 200) {
        // Return success without expecting a token
        return AppResponse<String>(
          success: true,
          data: "Password reset successfully",
        );
      } else {
        throw Exception("Server responded with status code ${response.statusCode}");
      }
    } on dio.DioError catch (e) {
      print("Dio error during password reset: $e");
      String errorMessage = "Network error occurred";
      if (e.response != null) {
        errorMessage = "Server error: ${e.response!.statusCode}";
        // Optionally, handle different types of Dio errors (e.g., timeouts, connectivity issues)
      }
      return AppResponse(success: false, errorMessage: errorMessage);
    } catch (e) {
      print("Error during password reset: $e");
      return AppResponse(success: false, errorMessage: e.toString());
    }
  }
}

















/*
class ResetPasswordCodeRepo extends GetxService{

  static List<String>? cookies;

  APIProvider apiProvider=Get.find<APIProvider>();

  Future<AppResponse<String>> resetpasswordcode(String email, String password ,String confirmation,String code) async {
    try {
      dio.Response response = await apiProvider.postRequest(
        "${APIProvider.url}password/reset",
        {},
        jsonEncode({
          "email":email,
          "password":password,
          "password_confirmation":confirmation,
          "code":code,
        }),
      );

      cookies =response.headers['set-cookie'];


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
}*/
