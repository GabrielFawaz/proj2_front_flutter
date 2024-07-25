import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/app_response.dart';
import '../pages/homepage/reportt.dart';
import '../repository/report_repo.dart';

class ReportController extends GetxController {
  final ReportRepo reportRepo = Get.find<ReportRepo>();

  GlobalKey<FormState> formKey=GlobalKey<FormState>();

  var isLoading = false.obs;
  var reports = <Reportt>[].obs;


  var firstSubmit =false.obs;
  var loginLoadingState=false.obs;

  TextEditingController titleController=TextEditingController(text:"room");
  TextEditingController descriptionController=TextEditingController(text:"picture");
  @override
  void onInit() {
    fetchReports();
    super.onInit();
  }

  Future<void> fetchReports() async {
    try {
      isLoading.value = true;
      List<Reportt> reportsList = (await reportRepo.getReports()).cast<Reportt>();
      print("Fetched reports: $reportsList");
      reports.assignAll(reportsList);
    } catch (e) {
      print("Error fetching reports: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void reportsomthing() async{
    firstSubmit.value=true;
    if(formKey.currentState!.validate()) {
      loginLoadingState.value = true;
      AppResponse response = await reportRepo.reportsomthing(
        titleController.text,
        descriptionController.text,
      );
      loginLoadingState.value = false;
      if (response.success) {
        print("Verification Code Response: ${response.data}");
        // Get.to(() => Report();
        Get.defaultDialog(
            title: "Success",
            content: Text(""),
            actions: [
              TextButton(onPressed: () {
                Get.back();
              },
                  child: Text("ok")),
            ]
        );
      } else {
        Get.defaultDialog(
            title: "Error",
            content: Text(response.errorMessage!),
            actions: [
              TextButton(onPressed: () {
                Get.back();
              },
                  child: Text("ok")),
            ]
        );
      }
    }}








}


