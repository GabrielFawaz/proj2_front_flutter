import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant/Language/CustomButtonLang.dart';
import '../constant/routes.dart';
import '../core/localaization/changeLocal.dart';



class Language extends GetView<LocaleController> {
  const Language({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  backgroundColor: Colors.transparent,
      body:

      Container(
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Column(
          children: [
            SizedBox(height: 100,),
            Image.asset(
              "assets/images/l1.jpg",
            //  fit: BoxFit.cover, // Adjust the fit of the image as needed
            ),
            SizedBox(height: 20), // Add some spacing between the image and the buttons
            Text("1".tr, style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),
            SizedBox(height: 20),
            CustomButtonLang(
              flagIcon: Icons.flag,
              textbutton: "En",
              onPressed: () {
                controller.changeLang("en");
                Get.toNamed(AppRoute.onBoarding);
              },
            ),
            SizedBox(height: 20),
            CustomButtonLang(
              flagIcon: Icons.flag,
              textbutton: "Ar",
              onPressed: () {
                controller.changeLang("ar");
                Get.toNamed(AppRoute.onBoarding);
              },
            ),
          ],
        ),
      )

    );
  }
}



