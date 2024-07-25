import 'package:get/get.dart';

import '../constant/sharedprefrence/shared.dart';
import '../providers/api_provider.dart';
import 'package:dio/dio.dart'; // Import Dio package

class RoomDetailsRepository {
  final APIProvider apiProvider = APIProvider(); // Assuming APIProvider setup correctly

  Future<dynamic> getRoomDetails(int roomId) async {
    try {
      String? token = await getToken(); // Retrieve token

      final response = await apiProvider.getRequest(
        "${APIProvider.url}getRoomDetails/$roomId",
        {}, // Add query parameters if required
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        return response.data['data']; // Return room details data
      } else {
        throw Exception('Failed to fetch room details');
      }
    } catch (e) {
      print("Error fetching room details: $e");
      throw e;
    }
  }
}

