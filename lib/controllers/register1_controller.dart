
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../models/app_response.dart';
import '../pages/auth/Register/verfiycode.dart';
import '../pages/homepage/homepage.dart';
import '../repository/register_repo.dart';
import 'homepage/homepage_controller.dart';
class Register1Controller extends GetxController{

  RegisterRepo registerRepo=Get.find<RegisterRepo>();

  GlobalKey<FormState> formkey=GlobalKey<FormState>();
  TextEditingController firstnameTextController=TextEditingController(text: "marla");
  TextEditingController lastnameTextController=TextEditingController(text:"beyrouthy");
  //TextEditingController emailTextController=TextEditingController(text:"beyrouthymarla@gmail.com");
  TextEditingController passwordTextController=TextEditingController    (text:"12345678");
  TextEditingController confirmationTextController=TextEditingController(text:"12345678");
  //TextEditingController photoTextController=TextEditingController(text:"pistol");
  TextEditingController phoneTextController=TextEditingController(text:"111");
  TextEditingController addressTextController=TextEditingController(text:"liban");
  TextEditingController personalidTextController=TextEditingController(text:"1111111");


  var firstSubmit=false.obs;

  var registerLoadingState=false.obs;

  var avatarImagePath = ''.obs;
  //File? image;

  var agreeTermsCondition = false.obs;

  void Register()async {
    firstSubmit.value=true;
    if(formkey.currentState!.validate()) {
      registerLoadingState.value=true;

      File? imageFile;
      if (avatarImagePath.value.isNotEmpty) {
        imageFile = File(avatarImagePath.value);
      }

      AppResponse response= await registerRepo.Register(
        firstnameTextController.text,
        lastnameTextController.text,
        passwordTextController.text,
        confirmationTextController.text,
        phoneTextController.text,
        addressTextController.text,
        personalidTextController.text,
        //emailTextController.text,
        photo: imageFile,
      );
      registerLoadingState.value=false;
      if(response.success){
        Get.to(() =>HotelHome (token: '',));
        Get.defaultDialog(
            title: "Success",
            content: Text(""),
            actions: [
              TextButton(onPressed: (){
                Get.back();
              }, child: Text("ok")),
            ]
        );
      }else{
        Get.defaultDialog(
            title: "Error",
            content: Text(response.errorMessage!),
            actions: [
              TextButton(onPressed: (){
                Get.back();
              }, child: Text("ok")),
            ]
        );
      }
    }
  }


  void pickImage(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      avatarImagePath.value = pickedFile.path;
       // image = File(pickedFile.path);
    }
  }

}