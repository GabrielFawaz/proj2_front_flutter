import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/app_response.dart';
import '../pages/auth/Register/register1.dart';
import '../pages/auth/login/login.dart';
import '../pages/homepage/homepage.dart';
import '../repository/resetpasswordcode_repo.dart';

class ResetPasswordCodeController extends GetxController{

  ResetPasswordCodeRepo  resetPasswordCodeRepo=Get.find<ResetPasswordCodeRepo>();

  GlobalKey<FormState> formKey=GlobalKey<FormState>();

  TextEditingController emailTextController=TextEditingController(text:"ramibeyrouthy7@gmail.com");
  TextEditingController passwordTextController=TextEditingController(text:"12411241");
  TextEditingController newpasswordTextController=TextEditingController(text:"12411241");
  TextEditingController codeTextController=TextEditingController(text:"Ar8q86");

  var firstSubmit =false.obs;

  var loginLoadingState=false.obs;

  void resetpasswordcode() async{
    firstSubmit.value=true;
    if(formKey.currentState!.validate()) {
      loginLoadingState.value = true;
      AppResponse response = await resetPasswordCodeRepo.resetpasswordcode(
          emailTextController.text,
          passwordTextController.text,
          newpasswordTextController.text,
          codeTextController.text,
         );
      loginLoadingState.value = false;
      if (response.success) {
        print("Verification Code Response: ${response.data}");
        Get.to(() => Login());
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
    }}

}


