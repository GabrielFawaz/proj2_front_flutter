import 'package:get/get.dart';
import 'package:dio/dio.dart'as dio;
import '../../../Services.dart';
import '../../../models/app_response.dart';
import '../../../providers/api_provider.dart';

MyServices myServices=Get.find();

class AdminProfileRepo extends GetxService{

  APIProvider apiProvider=Get.find<APIProvider>();

/*
  Future<AppResponse<String>> updateprofile(String firstname,lastname,String number ,String newpassword ,String newpasswordconfirmation,String currentpassword,String address,{File?photo})async {
    print("\n1");

    try {
      var formData = dio.FormData.fromMap({
        "first_name":  firstname,
        // "last_name": lastname,

        "phone":number,
        "new_password":newpassword,
        "new_password_confirmation":newpasswordconfirmation,
        "current_password":currentpassword,
        // "address" : address,
        // Append the image file if available
        if (photo != null) 'photo': await dio.MultipartFile.fromFile(photo.path),
      });

      dio.Response response = await apiProvider.postRequest(
          "${APIProvider.url}user/profile",
          {},
          jsonEncode({
            "first_name":  firstname,
            // "last_name": lastname,

            "phone":number,
            "new_password":newpassword,
            "new_password_confirmation":newpasswordconfirmation,
            "current_password":currentpassword,
          }),

          // token:  myServices.sharedPreferences.getString("token"),
          token: APIProvider.token
        //cookies: myServices.sharedPreferences.getString("cookies")
        //cookies: APIProvider.cookies!.first
      );

      print("\n2");
      APIProvider.cookies =response.headers['set-cookie'];

      String token = response.data["data"];

      print("Response status code: ${response.statusCode}");
      print("Response cookies: ${ APIProvider.cookies}");
      print("Response header: ${response.headers}");
      print("Response body: ${response.data}");
      print("Response token: $token");

      if (response.statusCode == 200) {
        if (response.data != null && response.data["data"] != null) {
          return AppResponse<String>(
            success: true,
            data: response.data["data"],
          );
        } else {
          throw Exception("Token not found in response data");
        }
      } else {
        throw Exception("Server responded with status code ${response.statusCode}");
      }
    } on dio.DioException catch (e) {
      print("Dio error : $e");
      String errorMessage = "Network error occurred";
      if (e.response != null) {
        errorMessage = "Server error: ${e.response!.statusCode}";
        // Optionally, handle different types of Dio errors (e.g., timeouts, connectivity issues)
      }
      return AppResponse(success: false, errorMessage: errorMessage);
    } catch (e) {
      print("Error : $e");
      return AppResponse(success: false, errorMessage: e.toString());
    }
  }
*/

  Future<AppResponse<Map<String, dynamic>>> AdminProfile() async {
    try {
      dio.Response response = await apiProvider.getRequest(
        "${APIProvider.url}dashboard/myProfile",
        {},
        headers: {
          'Authorization': 'Bearer ${myServices.sharedPreferences.getString("token")}',
        },
      );

      if (response.statusCode == 200 && response.data != null) {
        return AppResponse<Map<String, dynamic>>(
          success: true,
          data: response.data["data"],
        );
      } else {
        return AppResponse<Map<String, dynamic>>(
          success: false,
          errorMessage: response.data["msg"] ?? "Error fetching profile data",
        );
      }
    } on dio.DioException catch (e) {
      print("Dio error during profile fetch: $e");
      String errorMessage = "Network error occurred";
      if (e.response != null) {
        errorMessage = "Server error: ${e.response!.statusCode}";
      }
      return AppResponse(success: false, errorMessage: errorMessage);
    } catch (e) {
      print("Error during profile fetch: $e");
      return AppResponse(success: false, errorMessage: e.toString());
    }
  }





}