import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/constant/onboarding/static_onboarding.dart';

import '../../controllers/onboarding_controller.dart';
import '../../pages/Language.dart';
import '../../pages/auth/login/login.dart';


import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomButtonOnBoarding({Key? key}) : super(key: key);

  static const Color customColor = Color.fromRGBO(255, 160, 42, 1.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: MediaQuery.of(context).size.width * 0.6,
      child: ElevatedButton(
        onPressed: () {
          if (controller.currentPage.value == onBoardingList.length - 1) {
            // Navigate to the login page or next screen
            Get.to(Login());
          } else {
            // Move to the next onboarding screen
            controller.next();
          }
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(customColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Text(
            controller.currentPage.value == onBoardingList.length - 1
                ? 'Get Started'
                : 'Next',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
