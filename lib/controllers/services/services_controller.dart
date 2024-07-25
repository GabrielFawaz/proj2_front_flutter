import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/app_response.dart';
import '../../pages/services/services.dart';
import '../../repository/services_repo.dart';

class ServicesController extends GetxController {
  final ServicesRepo servicesRepo = Get.find<ServicesRepo>();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController serviceIdController = TextEditingController();
  TextEditingController bookingIdController = TextEditingController();


  var firstSubmit = false.obs;
  var requestLoadingState = false.obs;

  var isLoading = false.obs;
  var services = <Service>[].obs;
  var error = RxString('');

  @override
  void onInit() {
    //fetchBookingServices(1);
    // Fetch services for booking ID 5 on initialization
    super.onInit();
  }


  Future<void> fetchServices() async {
    try {
      isLoading.value = true;
      List<Service> servicesList = (await servicesRepo.getServices()).cast<Service>();
      services.assignAll(servicesList);
    } catch (e) {
      print("Error fetching services: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchBookingServices(int bookingId) async {
    try {
      isLoading.value = true;
      List<Service> servicesList = await servicesRepo.getBookingServices(bookingId);
      print("Fetched services: $servicesList");
      services.assignAll(servicesList);
      error.value = ''; // Clear any previous errors on success
    } catch (e) {
      print("Error fetching services: $e");
      error.value = 'Failed to fetch services: $e'; // Store error message on failure
    } finally {
      isLoading.value = false;
    }
  }



 void submitServiceRequest() async {
    firstSubmit.value = true;
    if (formKey.currentState!.validate()) {
      print("111");
      requestLoadingState.value = true;
      int serviceId = int.parse(serviceIdController.text);
      int bookingId = int.parse(bookingIdController.text);

      AppResponse response = await servicesRepo.RequestService(
          serviceId, bookingId);
      requestLoadingState.value = false;

      if (response.success) {
        Get.defaultDialog(
          title: "Success",
          content: Text("Service request submitted successfully"),
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
    else {
      print("000");
    }
  }

  void cancelServiceRequest() async {
    firstSubmit.value = true;
    if (formKey.currentState!.validate()) {
      requestLoadingState.value = true;
      int serviceId = int.parse(serviceIdController.text);
      int bookingId = int.parse(bookingIdController.text);

      AppResponse response = await servicesRepo.cancelServiceRequest(serviceId, bookingId);
      requestLoadingState.value = false;

      if (response.success) {
        Get.defaultDialog(
          title: "Success",
          content: Text("Service cancelled successfully"),
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


}

