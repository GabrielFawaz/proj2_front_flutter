import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:untitled1/Services.dart';
import 'dart:convert';
import '../constant/sharedprefrence/shared.dart';
import '../models/app_response.dart';
import '../pages/booking/bookingclass.dart';
import '../providers/api_provider.dart';


class BookingRoomRepo extends GetxService {
  final APIProvider apiProvider = Get.find<APIProvider>();
  MyServices myServices = Get.find();

  Future<AppResponse<Map<String, dynamic>>> bookRoom(
      int roomId,
      String checkInDate,
      String checkOutDate,
      int numAdults,
      int numChildren,
      String paymentMethod) async {
    try {
      final payload = {
        "room_id": roomId,
        "check_in_date": checkInDate,
        "check_out_date": checkOutDate,
        "num_adults": numAdults,
        "num_children": numChildren,
        "payment_method": paymentMethod,
      };

      print("Request payload: $payload");

      dio.Response response = await apiProvider.postRequest(
        "http://127.0.0.1:8000/api/booking",
        {},
        payload,
        cookies: APIProvider.cookies?.join("; "), // Ensure cookies are correctly formatted
        token: APIProvider.token, // Ensure token is correctly included
      );

      if (response.headers['set-cookie'] != null) {
        APIProvider.cookies = response.headers['set-cookie']!.map((e) => e.toString()).toList();
        myServices.sharedPreferences.setString("cookies", APIProvider.cookies!.join("; "));
      }

      print("Response status code: ${response.statusCode}");
      print("Response body: ${response.data}");

      if (response.statusCode == 200) {
        return AppResponse<Map<String, dynamic>>(
          success: true,
          data: response.data,
        );
      } else {
        print("Server responded with status code ${response.statusCode}");
        print("Error response: ${response.data}");
        throw Exception("Server responded with status code ${response.statusCode}");
      }
    } catch (e) {
      print("Error during booking: $e");
      return AppResponse(success: false, errorMessage: e.toString());
    }
  }



  Future<List<dynamic>> fetchMyBookings() async {
    try {
      // Replace with your token retrieval logic if needed
      String? token = await getToken(); // Example of fetching token

      dio.Response response = await apiProvider.getRequest(
        '${APIProvider.url}get/bookings',
        {},
        headers: {
          if (token != null) 'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> bookings = response.data['data']['bookings'];
        return bookings;
      } else {
        throw Exception('Failed to fetch bookings');
      }
    } catch (e) {
      print("Error fetching bookings: $e");
      throw Exception('Error fetching bookings: $e');
    }
  }


}
