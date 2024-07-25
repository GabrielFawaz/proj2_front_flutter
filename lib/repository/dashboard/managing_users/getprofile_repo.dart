
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import '../../../models/app_response.dart';
import '../../../providers/api_provider.dart';
import '../../checkemail_repo.dart';

class GetProfileRepo extends GetxService {
  APIProvider apiProvider = Get.find<APIProvider>();

  Future<AppResponse<Map<String, dynamic>>> getProfile(int userId) async {
    try {
      String url = "${APIProvider.url}dashboard/getProfile/$userId";
      String? token = myServices.sharedPreferences.getString("token");

      if (token == null) {
        return AppResponse<Map<String, dynamic>>(
          success: false,
          errorMessage: "Authorization token not found",
        );
      }

      print("Request URL: $url");
      print("Authorization Token: Bearer $token");

      dio.Response response = await apiProvider.getRequest(
        url,
        {},
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      print("Response Status Code: ${response.statusCode}");
      print("Response Data: ${response.data}");

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
      print("Dio error during profile fetch: ${e.response}");
      String errorMessage = "Network error occurred";
      if (e.response != null) {
        errorMessage = "Server error: ${e.response!.statusCode}, ${e.response!.data}";
      }
      return AppResponse(success: false, errorMessage: errorMessage);
    } catch (e) {
      print("Error during profile fetch: $e");
      return AppResponse(success: false, errorMessage: e.toString());
    }
  }
}
