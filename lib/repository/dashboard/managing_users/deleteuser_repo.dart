import 'package:get/get.dart';

import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';

import '../../../models/app_response.dart';
import '../../../providers/api_provider.dart';

class DeleteUserRepo extends GetxService {
  final APIProvider apiProvider = Get.find<APIProvider>();

  Future<AppResponse<void>> deleteUser(String userId) async {
    try {
      dio.Response response = await apiProvider.deleteRequest(
        "${APIProvider.url}dashboard/users/$userId",
        headers: {
          // Add headers if needed
        },
      );

      if (response.statusCode == 200) {
        return AppResponse(success: true);
      } else if (response.statusCode == 400) {
        throw Exception(response.data['error']);
      } else if (response.statusCode == 500) {
        throw Exception('Server error');
      } else {
        throw Exception('Unknown error');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
