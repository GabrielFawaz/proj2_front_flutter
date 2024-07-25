
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';

import '../../../models/app_response.dart';
import '../../../providers/api_provider.dart';

class AdminDelCreateRepo extends GetxService {
  final APIProvider apiProvider = APIProvider();

  Future<AppResponse<void>> deleteRoom(int roomId) async {
    try {
      dio.Response response = await apiProvider.deleteRequest(
        "${APIProvider.url}dashboard/rooms/$roomId",
      );

      if (response.statusCode == 200) {
        return AppResponse<void>(
          success: true,
          data: null,
          errorMessage: response.data['msg'],
        );
      } else {
        throw Exception("Server responded with status code ${response.statusCode}");
      }
    } catch (e) {
      print("Error during room deletion: $e");
      return AppResponse<void>(
        success: false,
        errorMessage: e.toString(),
      );
    }
  }
}
