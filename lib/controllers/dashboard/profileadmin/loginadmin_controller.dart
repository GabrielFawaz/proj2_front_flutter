import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/app_response.dart';
import '../../../repository/account_repo.dart';
import '../../../repository/dashboard/admin profile/loginadmin_repo.dart';

class loginAdminController extends GetxController{




  LoginAdminRepo loginAdminRepo=Get.find<LoginAdminRepo>();

  GlobalKey<FormState> formKey=GlobalKey<FormState>();

  TextEditingController usernameTextController=TextEditingController(text:"admin@gmail.com");
  TextEditingController PasswordTextController=TextEditingController(text:"12341234");

  var token = "".obs;

  var firstSubmit =false.obs;

  var loginLoadingState=false.obs;

  var logoutstatue = false.obs;

  var obscureText = true.obs;



  @override
  void onInit() {
    super.onInit();
    loadToken();
  }

  void loadToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token.value = prefs.getString('token') ?? '';
  }

  void toggleObscureText() {
    obscureText.toggle();
  }


  void loginadmin() async{
    firstSubmit.value=true;
    if(formKey.currentState!.validate()){
      loginLoadingState.value=true;
      AppResponse response=await  loginAdminRepo.login(usernameTextController.text, PasswordTextController.text);
      loginLoadingState.value=false;
      if(response.success){
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', response.data);
        //Get.to(() => HotelHome(token: response.data));
        Get.defaultDialog(
            title: "Success",
            content: Text(""),
            actions: [
              TextButton(onPressed: (){
                Get.back();
              },
                  child: Text("ok")),
            ]
        );
      }else{
        Get.defaultDialog(
            title: "Error",
            content: Text(response.errorMessage!),
            actions: [
              TextButton(onPressed: (){
                Get.back();
              },
                  child: Text("ok")),
            ]
        );

      }
    }
  }


}