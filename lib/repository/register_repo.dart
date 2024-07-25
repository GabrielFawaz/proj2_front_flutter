import 'dart:convert';
import 'dart:io'; // Import the 'dart:io' library

import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';

import '../Services.dart';
import '../models/app_response.dart';
import '../providers/api_provider.dart';
import 'checkemail_repo.dart';
MyServices myServices=Get.find();

class RegisterRepo extends GetxService {

  APIProvider apiProvider = Get.find<APIProvider>();

  Future<AppResponse<Map<String, dynamic>>> Register(
      String firstname,
      String lastname,
      String password,
      String confirmation,
      String address,
      String personalid,
      String phone,
      {File? photo}
      ) async {
    try {
      // Create FormData for the request
      var formData = dio.FormData.fromMap({
        "first_name": firstname,
        "last_name": lastname,
        "password": password,
        "password_confirmation": confirmation,
        "address": address,
        "personal_id": personalid,
        "phone": phone,
        // Append the image file if available
        if (photo != null) 'photo': await dio.MultipartFile.fromFile(photo.path),
      });

      dio.Response response = await apiProvider.postRequest(
          "${APIProvider.url}register/user",
        {},
        formData,// Pass formData instead of jsonEncode
          cookies:  APIProvider.cookies!.first
      );
      //APIProvider.cookies =response.headers['set-cookie'];
      //APIProvider.token = response.data["data"];
      String token = response.data["data"];
      myServices.sharedPreferences.setString("token", token);
        APIProvider.token = token;
      print("Response status code: ${response.statusCode}");
      print("Response body: ${response.data}");
     // print("Response token: ${APIProvider.token}");
      print("Response token: $token");

      print("Response cookies: ${ APIProvider.cookies}");
      if (response.statusCode == 200) {
        // Check if the response contains an "id" field



          return AppResponse<Map<String, dynamic>>(
            success: true,
            //data: {
              //"id": id,
             // "token": token,},
          );
        }
       else {
        // Handle non-200 status codes as needed
        return AppResponse<Map<String, dynamic>>(
          success: false,
          errorMessage: "Registration request failed with status code ${response.statusCode}",
        );
      }
    } catch (e) {
      return AppResponse<Map<String, dynamic>>(
        success: false,
        errorMessage: e.toString(),
      );
    }
  }
}
