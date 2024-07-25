
import 'package:dio/dio.dart'as dio;
import 'package:get/get.dart';
import 'dart:convert';
import '../../../constant/sharedprefrence/shared.dart';
import '../../../models/app_response.dart';
import '../../../pages/homepage/reportt.dart';
import '../../../providers/api_provider.dart';


class AdminReportRepo extends GetxService {
  final APIProvider apiProvider = Get.find<APIProvider>();


  Future<List<Report>> getUserReports(int userId) async {
    try {
      String? token = await getToken();
      if (token == null) {
        throw Exception("User not logged in");
      }

      final response = await apiProvider.getRequest(
        "${APIProvider.url}dashboard/users/$userId/reports",
        {},
        headers: {'Authorization': 'Bearer $token'},
      );

      print("Response data: ${response.data}");

      if (response.statusCode == 200 && response.data['status']) {
        List<dynamic> reportsJson = response.data['data'];
        return reportsJson.map((json) => Report.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch user reports');
      }
    } catch (e) {
      print("Error fetching user reports: $e");
      throw e;
    }
  }

  Future<List<Report>> ShowActiveReports() async {
    try {
      String? token = await getToken();
      if (token == null) {
        throw Exception("User not logged in");
      }

      final response = await apiProvider.getRequest(
        "${APIProvider.url}dashboard/reports",
        {},
        headers: {'Authorization': 'Bearer $token'},
      );

      print("Response data: ${response.data}");

      if (response.statusCode == 200 && response.data['status']) {
        List<dynamic> reportsJson = response.data['data'];
        return reportsJson.map((json) => Report.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch reports');
      }
    } catch (e) {
      print("Error fetching reports: $e");
      throw e;
    }
  }

  Future<AppResponse<String>> checkReports(List<int> reportIds) async {
    try {
      String? token = await getToken();
      if (token == null) {
        throw Exception("User not logged in");
      }

      dio.Response response = await apiProvider.postRequest(
        "${APIProvider.url}dashboard/reports/check",
        {},
        jsonEncode({
          "reports": reportIds,
        }),

      );

      print("Response status code: ${response.statusCode}");
      print("Response body: ${response.data}");

      if (response.statusCode == 200 && response.data['status']) {
        return AppResponse<String>(
          success: true,
          data: response.data['msg'],
        );
      } else {
        throw Exception("Server responded with status code ${response.statusCode}");
      }
    } catch (e) {
      print("Error during report check: $e");
      return AppResponse(success: false, errorMessage: e.toString());
    }
  }

}


class Report {
  final int id;
  final int userId;
  final String title;
  final String description;
  final int isChecked;

  Report({
    required this.id,
    required this.userId,
    required this.title,
    required this.description,
    required this.isChecked,
  });

  factory Report.fromJson(Map<String, dynamic> json) {
    return Report(
      id: json['id'],
      userId: json['user_id'],
      title: json['title'],
      description: json['text_description'],
      isChecked: json['is_checked'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'title': title,
      'text_description': description,
      'is_checked': isChecked,
    };
  }
}
