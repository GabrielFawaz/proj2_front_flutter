import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchUserController extends GetxController {
  String firstName = '';



  void SearchUser() {
    // Validate input fields and create user
    if (firstName.isEmpty )
        {

      Get.snackbar(
        'Error',
        'All fields are required',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }



    print('User created:');
    print('First Name: $firstName');


    Get.snackbar(
      'Success',
      'User created successfully',
    );
  }
}