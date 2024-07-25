import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/app_response.dart';
import '../../../pages/homepage/reportt.dart';
import '../../../repository/dashboard/admin_report/adminreport_repo.dart';


class AdminReportController extends GetxController {
  final AdminReportRepo adminreportRepo = Get.find<AdminReportRepo>();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  var isLoading = false.obs;
  var reports = <Report>[].obs;

  var firstSubmit = false.obs;
  var checkLoadingState = false.obs;


  @override
  void onInit() {
    fetchUserReports(3);
    super.onInit();
  }



  Future<void> fetchUserReports(int userId) async {
    try {
      isLoading.value = true;
      List<Report> userReportsList = (await adminreportRepo.getUserReports(userId)).cast<Report>();
      print("Fetched user reports: $userReportsList");
      reports.assignAll(userReportsList);
    } catch (e) {
      print("Error fetching user reports: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> ShowActiveReports() async {
    try {
      isLoading.value = true;
      List<Report> allReportsList = (await adminreportRepo.ShowActiveReports()).cast<Report>();
      print("Fetched all reports: $allReportsList");
      reports.assignAll(allReportsList);
    } catch (e) {
      print("Error fetching all reports: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void checkReports(List<int> reportIds) async {
    firstSubmit.value = true;
    checkLoadingState.value = true;
    AppResponse response = await adminreportRepo.checkReports(reportIds);
    checkLoadingState.value = false;
    if (response.success) {
      Get.defaultDialog(
        title: "Success",
        content: Text(response.data ?? "Reports checked successfully"),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text("OK"),
          ),
        ],
      );
    } else {
      Get.defaultDialog(
        title: "Error",
        content: Text(response.errorMessage!),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text("OK"),
          ),
        ],
      );
    }
  }

}
