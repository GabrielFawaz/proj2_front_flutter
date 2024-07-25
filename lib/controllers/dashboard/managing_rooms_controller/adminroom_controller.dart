

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/app_response.dart';
import '../../../pages/dashboard/managing_reports/roomadminclass.dart';
import '../../../pages/dashboard/managing_rooms/roomclass.dart';
import '../../../repository/dashboard/admin_room/adminroomrepo.dart';


class AdminRoomController extends GetxController {
  final AdminRoomRepo roomDetailsRepository = Get.find<AdminRoomRepo>();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController searchTextController = TextEditingController();
  TextEditingController viewTextController = TextEditingController();
  TextEditingController statusTextController = TextEditingController();

  var isLoading = false.obs;
  var roomDetail = Rxn<RoomDetail>();
  var rooms = <RoomDetail>[].obs;

  var roomss = <Roomm>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> fetchRoomDetails(int roomId) async {
    try {
      isLoading.value = true;
      RoomDetail fetchedRoomDetail = await roomDetailsRepository.getRoomDetails(
          roomId);
      roomDetail.value = fetchedRoomDetail;
    } catch (e) {
      print("Error fetching room details: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getAllRooms() async {
    try {
      isLoading.value = true;
      List<RoomDetail> fetchedRooms = await roomDetailsRepository.getAllRooms();
      rooms.assignAll(fetchedRooms);
    } catch (e) {
      print("Error fetching rooms: $e");
    } finally {
      isLoading.value = false;
    }
  }


  void searchRooms() async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;

      String search = searchTextController.text;
      String view = viewTextController.text;
      String status = statusTextController.text;

      AppResponse<List<Roomm>> response = await roomDetailsRepository
          .searchRooms(

          search, view, status
      );

      isLoading.value = false;

      if (response.success) {
        roomss.assignAll(response.data!);
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