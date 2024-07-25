import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/app_response.dart';
import '../../../repository/dashboard/managing_users/getprofile_repo.dart';

class GetProfileController extends GetxController {
  GetProfileRepo getProfileRepo = Get.find<GetProfileRepo>();

  var profileData = {}.obs;
  var loading = false.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getProfile(2);  // Assuming you want to fetch the profile for user with ID 2
  }

  void getProfile(int userId) async {
    loading.value = true;
    AppResponse<Map<String, dynamic>> response = await getProfileRepo.getProfile(userId);
    loading.value = false;

    if (response.success) {
      profileData.value = response.data!;
    } else {
      errorMessage.value = response.errorMessage!;
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
