import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/app_response.dart';
import '../pages/auth/Register/verfiycode.dart';
import '../repository/checkemail_repo.dart';

class CheckemailController extends GetxController{

  CheckEmailRepo  checkEmailRepo=Get.find<CheckEmailRepo >();

  GlobalKey<FormState> formKey=GlobalKey<FormState>();

  TextEditingController usernameTextController=TextEditingController(text:"basheeralkhiat86@gmail.com");

  var firstSubmit =false.obs;

  var loginLoadingState=false.obs;

  void Checkemail() async{
    firstSubmit.value=true;
    if(formKey.currentState!.validate()) {
      loginLoadingState.value = true;
      AppResponse response = await checkEmailRepo.Checkemail(
        usernameTextController.text);
      loginLoadingState.value = false;
      if (response.success) {
        Get.to(() => VerfiyCode());
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

