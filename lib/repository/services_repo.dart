import 'dart:convert';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import '../constant/sharedprefrence/shared.dart';
import '../models/app_response.dart';
import '../pages/services/services.dart';
import '../providers/api_provider.dart';

class ServicesRepo extends GetxService {
  final APIProvider apiProvider = Get.find<APIProvider>();


  Future<List<Service>> getBookingServices(int bookingId) async {
    try {
      String? token = await getToken();
      final response = await apiProvider.getRequest(
        "${APIProvider.url}bookings/$bookingId/services",
        {},
        headers: {'Authorization': 'Bearer $token'},      );

      print("Response data: ${response.data}");

      if (response.statusCode == 200) {
        List<dynamic> servicesJson = response.data['data'];
        return servicesJson.map((json) => Service.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch services');
      }
    } catch (e) {
      print("Error fetching services: $e");
      throw e;
    }
  }


  Future<List<Service>> getServices() async {
    try {
      String? token = await getToken();
      if (token == null) {
        throw Exception("User not logged in");
      }

      final response = await apiProvider.getRequest(
        "${APIProvider.url}index/services",
        {},
        headers: {'Authorization': 'Bearer $token'},
      );

      print("Response data: ${response.data}");

      if (response.statusCode == 200 && response.data['status'] == true) {
        List<dynamic> servicesJson = response.data['data'];
        return servicesJson.map((json) => Service.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch services');
      }
    } catch (e) {
      print("Error fetching services: $e");
      throw e;
    }
  }




  Future<AppResponse<String>> cancelServiceRequest(int serviceId, int bookingId) async {
    String? token = await getToken();

    try {
      dio.Response response = await apiProvider.postRequest(
        "${APIProvider.url}services/cancel",
        {},
        jsonEncode({
          "service_id": serviceId,
          "booking_id": bookingId,
        }),
       // token: token

      );

      APIProvider.cookies = response.headers['set-cookie'];

      if (response.statusCode == 200) {
        return AppResponse<String>(
          success: true,
        );
      } else {
        throw Exception("Server responded with status code ${response.statusCode}");
      }
    } catch (e) {
      return AppResponse(success: false, errorMessage: e.toString());
    }
  }


  Future<AppResponse<String>> RequestService(int serviceId, int bookingId) async {
    print("\n1");

    try {
      String? token = await getToken();
      dio.Response response = await apiProvider.postRequest(
        "${APIProvider.url}request/services",
        {},


        jsonEncode({
          "service_id": serviceId,
          "booking_id": bookingId,
        }),
        token: token,
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
        return AppResponse<String>(
          success: true,
        );
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

