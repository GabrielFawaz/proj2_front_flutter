import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant/onboarding/custombutton.dart';
import '../constant/onboarding/customslider.dart';
import '../constant/onboarding/dotcontroller.dart';
import '../controllers/onboarding_controller.dart';


class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp()) ;
    return Scaffold(
        backgroundColor: Colors.blueGrey[50],
        body: SafeArea(
          child: Column(children: [
            const Expanded(
              flex: 3,
              child: CustomSliderOnBoarding(),
            ),
            CustomButtonOnBoarding(),
SizedBox(height: 20,)
          ]),
        ));
  }
}