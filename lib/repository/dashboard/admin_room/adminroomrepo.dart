import 'dart:convert';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import '../../../constant/sharedprefrence/shared.dart';
import '../../../models/app_response.dart';
import '../../../pages/dashboard/managing_reports/roomadminclass.dart';
import '../../../pages/dashboard/managing_rooms/roomclass.dart';
import '../../../providers/api_provider.dart';

class AdminRoomRepo extends GetxService {
  final APIProvider apiProvider = APIProvider(); // Assuming APIProvider setup correctly

  Future<RoomDetail> getRoomDetails(int roomId) async {
    try {
      String? token = await getToken(); // Retrieve token

      dio.Response response = await apiProvider.getRequest(
        "${APIProvider.url}getRoomDetails/$roomId",
        {}, // Add query parameters if required
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200 && response.data['status']) {
        return RoomDetail.fromJson(response.data['data']);
      } else {
        throw Exception('Failed to fetch room details');
      }
    } catch (e) {
      print("Error fetching room details: $e");
      throw e;
    }
  }

  Future<List<RoomDetail>> getAllRooms() async {
    try {
      String? token = await getToken(); // Retrieve token

      final response = await apiProvider.getRequest(
        "${APIProvider.url}getAllRooms",
        {}, // Add query parameters if required
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200 && response.data['status']) {
        List<dynamic> roomsJson = response.data['data'];
        return roomsJson.map((json) => RoomDetail.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch rooms');
      }
    } catch (e) {
      print("Error fetching rooms: $e");
      throw e;
    }
  }

  Future<AppResponse<List<Roomm>>> searchRooms(String search, String view, String status) async {
    print("\n1");

    try {
      dio.Response response = await apiProvider.postRequest(
        "${APIProvider.url}searchRooms",
        {},
        jsonEncode({
          "search": search,
          "view": view,
          "status": status,
        }),
      );
      print("\n2");
      APIProvider.cookies = response.headers['set-cookie'];

      print("Response status code: ${response.statusCode}");
      print("Response body: ${response.data}");

      if (response.statusCode == 200) {
        List<dynamic> roomsJson = response.data['data'];
        List<Roomm> rooms = roomsJson.map((json) => Roomm.fromJson(json)).toList();
        return AppResponse<List<Roomm>>(success: true, data: rooms);
      } else {
        throw Exception("Server responded with status code ${response.statusCode}");
      }
    } catch (e) {
      print("Error during room search: $e");
      return AppResponse(success: false, errorMessage: e.toString());
    }
  }

}