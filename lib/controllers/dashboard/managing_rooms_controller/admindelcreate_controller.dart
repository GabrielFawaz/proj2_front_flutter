
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/room/room.dart';
import '../../../models/app_response.dart';
import '../../../repository/dashboard/admin_room/admindc_repo.dart';

/*
class AdminDelCreateController extends GetxController {
  final AdminDelCreateRepo adminDelCreateRepo = Get.find<AdminDelCreateRepo>();

  RxBool isLoading = false.obs;

  // Dummy room list for example
  List<Room> get roomList => [
    Room(id: 1, roomNumber: '101', floor: ''),
    Room(id: 2, roomNumber: '102'),
    Room(id: 3, roomNumber: '103'),
  ];

  void deleteRoom(int roomId) async {
    bool confirmDeletion = await Get.defaultDialog(
      title: "Confirm Deletion",
      content: Text("Are you sure you want to delete this room?"),
      actions: [
        TextButton(
          onPressed: () {
            Get.back(result: true);
          },
          child: Text("Yes"),
        ),
        TextButton(
          onPressed: () {
            Get.back(result: false);
          },
          child: Text("No"),
        ),
      ],
    );

    if (confirmDeletion) {
      isLoading.value = true;

      AppResponse<void> response = await adminDelCreateRepo.deleteRoom(roomId);

      isLoading.value = false;

      if (response.success) {
        Get.snackbar(
          "Success",
          response.errorMessage ?? "Room deleted successfully",
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        Get.defaultDialog(
          title: "Error",
          content: Text(response.errorMessage ?? "Unknown error occurred"),
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
}*/
