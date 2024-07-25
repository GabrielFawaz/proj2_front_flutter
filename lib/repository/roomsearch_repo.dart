import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

import '../constant/room/room.dart';
import '../models/app_response.dart';
import '../providers/api_provider.dart'; // Replace with your actual API provider file

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'dart:convert';

class RoomSearchRepo extends GetxService {
  APIProvider apiProvider = Get.find<APIProvider>();
  Future<AppResponse<List<Room>>> searchRooms(String search,
      String view,
      String basePrice,
      String averageRating) async {
    print("\n1");

    try {
      dio.Response response = await apiProvider.postRequest(
        "${APIProvider.url}searchRooms",
        {},
        jsonEncode({
          "search": search,
          "view": view,
          "basePrice": basePrice,
          "averageRating": averageRating,
        }),
      );
      print("\n2");
      APIProvider.cookies = response.headers['set-cookie'];

      print("Response status code: ${response.statusCode}");
      print("Response body: ${response.data}");

      print("Response cookies: ${ APIProvider.cookies}");
      print("Response header: ${response.headers}");
      print("Response header: ${response}");
      // cookie = response.headers['set-cookie'];

      if (response.statusCode == 200) {
        List<dynamic> roomsJson = response.data['data'];
        List<Room> rooms = roomsJson.map((json) => Room.fromJson(json))
            .toList();
        return AppResponse<List<Room>>(success: true, data: rooms);
      } else {
        throw Exception(
            "Server responded with status code ${response.statusCode}");
      }
    } catch (e) {
      print("Error during login: $e");
      return AppResponse(success: false, errorMessage: e.toString());
    }
  }




}
