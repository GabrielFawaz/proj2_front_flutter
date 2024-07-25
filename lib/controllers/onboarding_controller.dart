
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../Services.dart';
import '../constant/onboarding/static_onboarding.dart';
import '../constant/routes.dart';



abstract class OnBoardingController extends GetxController {
  next();
  onPageChanged(int index);
}

class OnBoardingControllerImp extends OnBoardingController {
  late PageController pageController;

 // int currentPage = 0;
  RxInt currentPage = 0.obs;

  MyServices myServices= Get.find();

  @override
  next() {
    currentPage.value++;
  //  currentPage++;

    if (currentPage > onBoardingList.length - 1) {

      myServices.sharedPreferences.setString("onbiarding", "1");

      Get.offAllNamed(AppRoute.login) ;
    } else {
      pageController.animateToPage(currentPage.value,
          duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
    }
  }

  @override
  onPageChanged(int index) {
    //currentPage = index;
    currentPage.value = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}