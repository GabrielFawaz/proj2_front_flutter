import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../pages/homepage/homepage.dart';
import '../repository/account_repo.dart';
import '../models/app_response.dart';
import 'homepage/homepage_controller.dart';

class loginController extends GetxController{



  //LoginRepo accountRepo= Get.find<LoginRepo>();
  AccountRepo accountRepo=Get.find<AccountRepo>();

  GlobalKey<FormState> formKey=GlobalKey<FormState>();

  TextEditingController usernameTextController=TextEditingController(text:"basheeralkhiat86@gmail.com");
  TextEditingController PasswordTextController=TextEditingController(text:"12345678");
  TextEditingController checkPasswordTextController=TextEditingController(text:"12345678");

  var token = "".obs;

  var firstSubmit =false.obs;

  var loginLoadingState=false.obs;

  var logoutstatue = false.obs;

  var obscureText = true.obs;

  final HotelHomeController controller = Get.find<HotelHomeController>();


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


  void login() async{
    firstSubmit.value=true;
    if(formKey.currentState!.validate()){
      loginLoadingState.value=true;
      AppResponse response=await  accountRepo.login(usernameTextController.text, PasswordTextController.text);
      loginLoadingState.value=false;
      if(response.success){
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', response.data);
        Get.to(() => HotelHome(token: response.data));
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


  void checkpassword() async{
    firstSubmit.value=true;
    if(formKey.currentState!.validate()){
      loginLoadingState.value=true;
      AppResponse response=await  accountRepo.checkpassword(checkPasswordTextController.text);
      loginLoadingState.value=false;
      if(response.success){
        Get.to(() => HotelHome(token: response.data));
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

  /*void logout() async {
    if (token.value.isNotEmpty) {
      AppResponse response = await accountRepo.logout(token.value);
      if (response.success) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.remove('token');
        logoutstatue.value = true;
      } else {
        logoutstatue.value = false;
        Get.defaultDialog(
          title: "Error",
          content: Text(response.errorMessage!),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text("OK"),
            ),
          ],
        );
      }
    } else {
      Get.defaultDialog(
        title: "Error",
        content: Text("Token not found"),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text("OK"),
          ),
        ],
      );
    }
  }*/
}