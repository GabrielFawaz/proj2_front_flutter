import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../constant/room/room.dart';
import '../models/app_response.dart';

import '../repository/roomsearch_repo.dart';


class RoomSearchController extends GetxController {
  RoomSearchRepo roomSearchRepo = Get.find<RoomSearchRepo>();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController searchTextController = TextEditingController();
  TextEditingController viewTextController = TextEditingController();
  TextEditingController basePriceTextController = TextEditingController();
  TextEditingController averageRatingTextController = TextEditingController();

  var isLoading = false.obs;
  var rooms = <Room>[].obs;

  void searchRooms() async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;

      String search = searchTextController.text;
      String view = viewTextController.text;
      String basePrice = basePriceTextController.text;
      String averageRating = averageRatingTextController.text;

      AppResponse<List<Room>> response = await roomSearchRepo.searchRooms(
        search,
        view,
        basePrice,
        averageRating,
      );

      isLoading.value = false;

      if (response.success) {
        rooms.assignAll(response.data!);
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
