import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/app_response.dart';
import '../../pages/booking/bookingclass.dart';
import '../../repository/bookingroom_repo.dart';



class BookingRoomController extends GetxController {
  final BookingRoomRepo bookingroomRepo = Get.find<BookingRoomRepo>();


  @override
  void onInit() {
    //fetchMyBookings();
    super.onInit();
  }

  Future<void> fetchMyBookings() async {
    try {
      isLoading.value = true;
      List<dynamic> bookingsList = await bookingroomRepo.fetchMyBookings();

      bookings.assignAll(bookingsList);
      error.value = ''; // Clear any previous errors on success
    } catch (e) {
      print("Error fetching bookings: $e");
      error.value =
      'Failed to fetch bookings: $e'; // Store error message on failure
    } finally {
      isLoading.value = false;
    }
  }






  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController roomIdController = TextEditingController(text: "1");
  TextEditingController checkInDateController = TextEditingController(
      text: "2024-06-29");
  TextEditingController checkOutDateController = TextEditingController(
      text: "2024-06-30");
  TextEditingController numAdultsController = TextEditingController(text: "2");
  TextEditingController numChildrenController = TextEditingController(
      text: "1");
  TextEditingController paymentMethodController = TextEditingController(
      text: "cash");

  var firstSubmit = false.obs;
  var bookingLoadingState = false.obs;

  void bookRoom() async {
    firstSubmit.value = true;
    if (formKey.currentState!.validate()) {
      bookingLoadingState.value = true;

      int roomId = int.parse(roomIdController.text);
      String checkInDate = checkInDateController.text;
      String checkOutDate = checkOutDateController.text;
      int numAdults = int.parse(numAdultsController.text);
      int numChildren = int.parse(numChildrenController.text);
      String paymentMethod = paymentMethodController.text;

      AppResponse response = await bookingroomRepo.bookRoom(
          roomId, checkInDate, checkOutDate, numAdults, numChildren,
          paymentMethod
      );

      bookingLoadingState.value = false;
      if (response.success) {
        Get.defaultDialog(
          title: "Success",
          content: Text("Booking created successfully."),
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


  var isLoading = false.obs;
  var bookings = <dynamic>[].obs;
  var error = RxString(''); // RxString for reactive error handling


}