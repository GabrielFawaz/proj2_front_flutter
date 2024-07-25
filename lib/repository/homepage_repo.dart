import 'dart:io'; // Import the 'dart:io' library
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import '../constant/sharedprefrence/shared.dart';
import '../providers/api_provider.dart';

class HomePageRepo extends GetxService {
  APIProvider apiProvider = Get.find<APIProvider>();

//
  Future<Map<String, dynamic>> getRoomDetails(int roomId) async {
    try {
      String? token = await getToken();
      print(6);
      if (token == null) {
        throw Exception("User not logged in");
      }
      print(5);
      final response = await apiProvider.getRequest(
        "${APIProvider.url}getRoomDetails/$roomId",
        {},
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        return response.data['data'];
      } else {
        throw Exception('Failed to fetch room details');
      }
    } catch (e) {
      print("Error fetching room details: $e");
      throw e;
    }
  }


  Future<List<dynamic>> getwishlist() async {
    try {
      // Retrieve token
      String? token = await getToken();
      if (token == null) {
        throw Exception("User not logged in");
      }

      final response = await apiProvider.getRequest(
        "${APIProvider.url}wishlist",
        {},
        headers: {'Authorization': 'Bearer $token'}, // Pass the token here
      );

      if (response.statusCode == 200) {
        // Extract wishlist data from response
        List<dynamic> wishlistData = response.data['msg']['wishlist'];
        return wishlistData;
      } else {
        throw Exception('Failed to fetch wishlist');
      }
    } catch (e) {
      print("Error fetching wishlist: $e");
      throw e;
    }
  }


  Future<void> addToWishlist(int roomId) async {
    try {
      // Retrieve token
      String? token = await getToken();
      print(6);
      if (token == null) {
        throw Exception("User not logged in");
      }
print(5);
      // Call getRequest method from APIProvider
      final response = await apiProvider.getRequest(
        "${APIProvider.url}wishlists/add?roomId=$roomId",
        {},
        headers: {'Authorization': 'Bearer $token',

        }, // Pass the token here
      );
      print("Response: $response");
      print(token);
      // Handle response here
      print("Response status: ${response.statusCode}");
      print("Response data: ${response.data}");
    } catch (e) {
      // Handle error
      print("Error: $e");
      rethrow;
    }
  }


  Future<void> removeFromWishlist(int roomId) async {
    try {
      String? token = await getToken();
      if (token == null) {
        throw Exception("User not logged in");
      }

      final response = await apiProvider.deleteRequest(
        "${APIProvider.url}wishlist/$roomId",
        headers: {'Authorization': 'Bearer $token',

        },
      );

      print("Response status: ${response.statusCode}");
      print("Response data: ${response.data}");
    } catch (e) {
      print("Error: $e");
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      String? token = await getToken();
      if (token == null) {
        throw Exception("User not logged in");
      }

      final response = await apiProvider.getRequest(
        "${APIProvider.url}logout",
        {},
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        // Handle successful logout, e.g., clear token, update UI, etc.
        print("Logout successful");
        print("Response: ${response.data}");
      } else {
        throw Exception('Failed to logout');
      }
    } catch (e) {
      print("Error during logout: $e");
      throw e;
    }
  }





}



/*Future<void> addToWishlist(int roomid) async {
    try {
      // Call getRequest method from APIProvider
      final response = await apiProvider.getRequest(
        "${APIProvider.url}wishlists/add?roomId=2",
        {},

      );

      // Handle response here
      print(response.data);
    } catch (e) {
      // Handle error
      print("Error: $e");
    }
  }*/











/*
  Future<AppResponse<String>> deleteFromWishlist(String rating, String comment) async {
    try {
      final response = await apiProvider.deleteRequest(
        "${APIProvider.url}wishlist1",
        queryParameters: {
          'rating': rating,
          'comment': comment,
        },
      );

      APIProvider.cookies = response.headers['set-cookie'];
      String token = response.data["data"];

      print("Response status code: ${response.statusCode}");
      print("Response cookies: ${APIProvider.cookies}");
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
    } on DioError catch (e) {
      print("Dio error during wishlist deletion: $e");
      String errorMessage = "Network error occurred";
      if (e.response != null) {
        errorMessage = "Server error: ${e.response!.statusCode}";
        // Optionally, handle different types of Dio errors (e.g., timeouts, connectivity issues)
      }
      return AppResponse(success: false, errorMessage: errorMessage);
    } catch (e) {
      print("Error during wishlist deletion: $e");
      return AppResponse(success: false, errorMessage: e.toString());
    }
  }
*/









/*
  Future<void> getWishlist(int rating, String comment,String cookie) async {
    try {
      // Call getRequest method from APIProvider
      final response = await apiProvider.getRequest(
        "wishlist",
        {
          "rating": rating.toString(),
          "comment": comment,
        },
        cookie: cookie,// Endpoint for getting wishlist
      );

      // Handle response here
      print(response.data);
    } catch (e) {
      // Handle error
      print("Error: $e");
      throw e; // Rethrow the error to be handled by the caller
    }
  }
*/