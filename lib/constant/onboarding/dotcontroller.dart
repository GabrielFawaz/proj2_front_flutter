import 'package:flutter/material.dart';
import 'package:untitled1/constant/onboarding/static_onboarding.dart';


class CustomDotControllerOnBoarding extends StatelessWidget {
  const CustomDotControllerOnBoarding({Key? key}) : super(key: key);

  static const Color customColor=Color.fromRGBO(255, 160, 42, 1.0);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(
            onBoardingList.length,
                (index) => AnimatedContainer(
              margin: const EdgeInsets.only(right: 5),
              duration: const Duration(milliseconds: 900),
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                  //color: AppColor.primaryColor,

                color: customColor,
                  borderRadius: BorderRadius.circular(10)),
            ))
      ],
    );
  }
}