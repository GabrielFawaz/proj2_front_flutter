
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/app_response.dart';
import '../pages/auth/Register/register1.dart';
import '../repository/checkemail_repo.dart';
import '../repository/verfiycode_repo.dart';

/*
class VerfiyCodeController extends GetxController{

  VerfiyCodeRepo  verfyCodeRepo=Get.find<VerfiyCodeRepo>();

  GlobalKey<FormState> formKey=GlobalKey<FormState>();

  TextEditingController numberTextController=TextEditingController(text:"713276");

  var firstSubmit =false.obs;

  var loginLoadingState=false.obs;



  void verfiycode(String text) async{
    print("\nverfiycode\n");
    firstSubmit.value=true;
    if(formKey.currentState!.validate()) {
      loginLoadingState.value = true;
      print("\nAppResponse response = await verfyCodeRepo.verfiycode(\n");

      AppResponse response = await verfyCodeRepo.verfiycode(
          numberTextController.text);
      print("\nloginLoadingState.value = false;\n");

      loginLoadingState.value = false;
      if (response.success) {
        print("Verification Code Response: ${response.data}");
        Get.to(() => Register1());
        Get.defaultDialog(
            title: "Success",
            content: Text(""),
            actions: [
              TextButton(onPressed: () {
                Get.back();
              },
                  child: Text("ok")),
            ]
        );
      } else {
        Get.defaultDialog(
            title: "Error",
            content: Text(response.errorMessage!),
            actions: [
              TextButton(onPressed: () {
                Get.back();
              },
                  child: Text("ok")),
            ]
        );
      }
    }}}
*/


class VerfiyCodeController extends GetxController {
  VerfiyCodeRepo verfyCodeRepo = Get.find<VerfiyCodeRepo>();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var otpCode = ''.obs;  // Store the OTP code
  var firstSubmit = false.obs;
  var loginLoadingState = false.obs;

  void verifyCode() async {
    firstSubmit.value = true;
    if (formKey.currentState!.validate()) {
      loginLoadingState.value = true;

      AppResponse response = await verfyCodeRepo.verfiycode(otpCode.value);

      loginLoadingState.value = false;
      if (response.success) {
        Get.to(() => Register1());
        Get.defaultDialog(
          title: "Success",
          content: Text(""),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text("ok"),
            ),
          ],
        );
      } else {
        Get.defaultDialog(
          title: "Error",
          content: Text(response.errorMessage!),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text("ok"),
            ),
          ],
        );
      }
    }
  }
}