import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:image_picker/image_picker.dart';
import '../../../constant/auth/custombottomauth.dart';
import '../../../constant/auth/customtextbodyauth.dart';
import '../../../constant/auth/customtexttitleauth.dart';
import '../../../controllers/register1_controller.dart';

//TODO THE OLD REGISTER DESGIN
/*class Register1 extends GetView<Register1Controller> {
  const Register1({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    Get.put(Register1Controller());

    Color customColor = Color.fromRGBO(255, 160, 42, 1.0);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body:
      Stack(
          children: [
            // Background Image
            Positioned.fill(
              child: Container(
                color: Colors.black, // Change this to the color you want
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 17),
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.6), // Adjust the opacity here
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                    bottomLeft: Radius.circular(0.0), // Adjust this value as needed
                    bottomRight: Radius.circular(0.0), // Adjust this value as needed
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                width: MediaQuery.of(context).size.width /0.25,
                height: MediaQuery.of(context).size.width / 0.5,
                padding: EdgeInsets.all(20),
                child: Form(
                  key: controller.formkey,
                  child: ListView(children: [
                    CustomTextTitleAuth(text: "5"),
                    const SizedBox(height: 10),
                    CustomTextBodyAuth(text: "10"),
                    const SizedBox(height: 15),

                    Row(
                      children: [
                        GestureDetector(
                            onTap: () =>

                                controller.pickImage(context),

                            child: Obx(
                                  ()=> CircleAvatar(
                                minRadius: 35,
                                maxRadius: 35,
                                backgroundImage:
                                controller.avatarImagePath.value.isEmpty
                                    ?null
                                    :FileImage(File(controller.avatarImagePath.value)) ,

                                 child: controller.avatarImagePath.isEmpty
                                    ? Icon(Icons.add_a_photo) // Display an icon if no image is selected
                                    : null,
                              ),)
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Obx(
                            ()=> TextFormField(
                          //  controller: controller.firstnameTextController,
                          autovalidateMode:  !controller.firstSubmit.value?
                          AutovalidateMode.disabled:
                          AutovalidateMode.always,
                          controller: controller.firstnameTextController,
                          validator: (String ? value){
                            if(value!.isEmpty){
                              return "Required Field";
                            }
                            return null;
                          },

                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            hintText: '23'.tr,
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.all(20),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Obx(
                            ()=> TextFormField(
                          //  controller: controller.firstnameTextController,
                          autovalidateMode:  !controller.firstSubmit.value?
                          AutovalidateMode.disabled:
                          AutovalidateMode.always,
                          controller: controller.lastnameTextController,
                          validator: (String ? value){
                            if(value!.isEmpty){
                              return "Required Field";
                            }
                            return null;
                          },

                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            hintText: '22'.tr,
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.all(20),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Obx(
                            ()=> TextFormField(
                          //   controller: controller.passwordTextController,
                          autovalidateMode:  !controller.firstSubmit.value?
                          AutovalidateMode.disabled:
                          AutovalidateMode.always,
                          controller: controller.passwordTextController,

                          validator: (String ? value){
                            if(value!.isEmpty){
                              return "Required Field";
                            }
                            if (value.length < 8) {
                              return "Password must be at least 8 characters long";
                            }
                            // Ensure password and confirmation match
                            if (value != controller.confirmationTextController.text) {
                              return "Passwords do not match";
                            }
                          },
                          obscureText: true,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            hintText: 'Enter Passowrd',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.all(20),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Obx(
                            ()=> TextFormField(
                          //   controller: controller.passwordTextController,
                          autovalidateMode:  !controller.firstSubmit.value?
                          AutovalidateMode.disabled:
                          AutovalidateMode.always,
                          controller: controller.confirmationTextController,

                          validator: (String ? value){
                            if(value!.isEmpty){
                              return "Required Field";
                            }
                            if (value.length < 8) {
                              return "Password must be at least 8 characters long";
                            }
                            // Ensure password and confirmation match
                            if (value != controller.confirmationTextController.text) {
                              return "Passwords do not match";
                            }
                          },
                          obscureText: true,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            hintText: '21'.tr,
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.all(20),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Obx(
                            ()=> TextFormField(
                          // controller: controller.addressTextController,
                          autovalidateMode:  !controller.firstSubmit.value?
                          AutovalidateMode.disabled:
                          AutovalidateMode.always,
                          controller: controller.addressTextController,

                          validator: (String ? value){
                            if(value!.isEmpty){
                              return "Required Field";
                            }
                            return null;
                          },

                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            hintText: '20'.tr,
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.all(20),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Obx(
                            ()=> TextFormField(
                          // controller: controller.addressTextController,
                          autovalidateMode:  !controller.firstSubmit.value?
                          AutovalidateMode.disabled:
                          AutovalidateMode.always,
                          controller: controller.personalidTextController,

                          validator: (String ? value){
                            if(value!.isEmpty){
                              return "Required Field";
                            }
                            return null;
                          },

                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            hintText: '19'.tr,
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.all(20),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Obx(
                            ()=> TextFormField(
                          // controller: controller.addressTextController,
                          autovalidateMode:  !controller.firstSubmit.value?
                          AutovalidateMode.disabled:
                          AutovalidateMode.always,
                          controller: controller.phoneTextController,

                          validator: (String ? value){
                            if(value!.isEmpty){
                              return "Required Field";
                            }
                            return null;
                          },

                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            hintText: '18'.tr,
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.all(20),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),



                   CustomButtomAuth(text: "5", onPressed: () {
                           controller.Register();

    }),



                  ]),
                ),
              ),
            )




          ])
    );

  }}*/


class Register1 extends GetView<Register1Controller> {
  const Register1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(Register1Controller());

    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 17),
        child: Container(

          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: controller.formkey,
              child: ListView(
                children: [
                  CustomTextTitleAuth(text: "5"),
                  const SizedBox(height: 10),
                  CustomTextBodyAuth(text: "10"),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () =>

                              controller.pickImage(context),

                          child: Obx(
                                ()=> CircleAvatar(
                              minRadius: 35,
                              maxRadius: 35,
                              backgroundImage:
                              controller.avatarImagePath.value.isEmpty
                                  ?null
                                  :FileImage(File(controller.avatarImagePath.value)) ,

                              child: controller.avatarImagePath.isEmpty
                                  ? Icon(Icons.add_a_photo) // Display an icon if no image is selected
                                  : null,
                            ),)
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),

                  Obx(
                        () => TextFormField(
                      autovalidateMode: !controller.firstSubmit.value
                          ? AutovalidateMode.disabled
                          : AutovalidateMode.always,
                      controller: controller.firstnameTextController,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Required Field";
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        hintText: 'First_Name',
                        hintStyle: TextStyle(color: Colors.grey),
                        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide.none,
                        ),

                      ),
                    ),
                  ),
                const SizedBox(height: 15),
                  Obx(
                        () => TextFormField(
                      autovalidateMode: !controller.firstSubmit.value
                          ? AutovalidateMode.disabled
                          : AutovalidateMode.always,
                      controller: controller.lastnameTextController,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Required Field";
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            hintText: 'Last_Name',
                            hintStyle: TextStyle(color: Colors.grey),
                            contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide.none,
                            ),

                          ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Obx(
                        () => TextFormField(
                      autovalidateMode: !controller.firstSubmit.value
                          ? AutovalidateMode.disabled
                          : AutovalidateMode.always,
                      controller: controller.passwordTextController,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Required Field";
                        }
                        if (value.length < 8) {
                          return "Password must be at least 8 characters long";
                        }
                        // Ensure password and confirmation match
                        if (value != controller.confirmationTextController.text) {
                          return "Passwords do not match";
                        }
                        return null;
                      },
                      obscureText: true,
                      style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            hintText: 'Enter Password',
                            hintStyle: TextStyle(color: Colors.grey),
                            contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide.none,
                            ),

                          ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Obx(
                        () => TextFormField(
                      autovalidateMode: !controller.firstSubmit.value
                          ? AutovalidateMode.disabled
                          : AutovalidateMode.always,
                      controller: controller.confirmationTextController,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Required Field";
                        }
                        if (value.length < 8) {
                          return "Password must be at least 8 characters long";
                        }
                        // Ensure password and confirmation match
                        if (value != controller.passwordTextController.text) {
                          return "Passwords do not match";
                        }
                        return null;
                      },
                      obscureText: true,
                      style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            hintText: 'Confrim Password',
                            hintStyle: TextStyle(color: Colors.grey),
                            contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide.none,
                            ),

                          ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Obx(
                        () => TextFormField(
                      autovalidateMode: !controller.firstSubmit.value
                          ? AutovalidateMode.disabled
                          : AutovalidateMode.always,
                      controller: controller.addressTextController,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Required Field";
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            hintText: 'Address',
                            hintStyle: TextStyle(color: Colors.grey),
                            contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide.none,
                            ),

                          ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Obx(
                        () => TextFormField(
                      autovalidateMode: !controller.firstSubmit.value
                          ? AutovalidateMode.disabled
                          : AutovalidateMode.always,
                      controller: controller.personalidTextController,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Required Field";
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            hintText: 'Personal Id',
                            hintStyle: TextStyle(color: Colors.grey),
                            contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide.none,
                            ),

                          ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Obx(
                        () => TextFormField(
                      autovalidateMode: !controller.firstSubmit.value
                          ? AutovalidateMode.disabled
                          : AutovalidateMode.always,
                      controller: controller.phoneTextController,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Required Field";
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            hintText: 'Phone Number',
                            hintStyle: TextStyle(color: Colors.grey),
                            contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide.none,
                            ),

                          ),                    ),
                  ),
                  SizedBox(height: 20),

                  Row(
                    children: [
                      Checkbox(
                        value: controller.agreeTermsCondition.value,
                        onChanged: (value) {
                          controller.agreeTermsCondition.value = value!;
                        },
                      ),
                      GestureDetector(
                        onTap: () {
                          // Handle Terms$Condition click action
                        },
                        child: RichText(
                          text: TextSpan(
                            text: 'Agree with ',
                            style: TextStyle(color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Terms&Condition',
                                style: TextStyle(
                                  color:  Color(0xFF2B74FE),
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      controller.Register();
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF003398)),
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        EdgeInsets.symmetric(vertical: 15, horizontal: 20), // Adjust padding as needed
                      ),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}





/*
                    Obx(()=>controller.registerLoadingState.value?
                    ElevatedButton(
                        onPressed: null,
                        child: SizedBox(width: 20,height: 20,
                          child:CircularProgressIndicator() ,)):
                    ElevatedButton( onPressed: controller.registerLoadingState.value
                        ? null
                        : () {
                      controller.Register();
                    },

                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, backgroundColor: customColor,
                        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: controller.registerLoadingState.value
                          ? SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(),
                      )
                          : Text('Sign Up'),
                    ),*/


/*

      Form(
        key: controller.formkey,
        child: Container(


          alignment: Alignment.bottomCenter, // Align the container to the bottom center
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white60,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
                bottomLeft: Radius.circular(0.0), // Adjust this value as needed
                bottomRight: Radius.circular(0.0), // Adjust this value as needed
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            width: MediaQuery.of(context).size.width / 1,
            height: MediaQuery.of(context).size.width / 0.5,
            padding: EdgeInsets.all(20),
            child: ListView(
                children:[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset: Offset(0, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Text(
                          "WELCOME TO OUR APP",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(height: 30,),
                      Row(
                        children: [
                          GestureDetector(
                              onTap: () =>

                                  controller.pickImage(context),

                              child: Obx(
                                    ()=> CircleAvatar(
                                  minRadius: 35,
                                  maxRadius: 35,
                                  backgroundImage:controller.avatarImagePath.value.isNotEmpty
                                      ? AssetImage(controller.avatarImagePath.value)
                                      : null,

                                  child: controller.avatarImagePath.value.isEmpty
                                      ? Icon(Icons.add_a_photo) // Display an icon if no image is selected
                                      : null,
                                ),)
                          ),
                        ],
                      ),
                      SizedBox(height: 15,),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset: Offset(0, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Obx(
                              ()=> TextFormField(
                            //  controller: controller.firstnameTextController,
                            autovalidateMode:  !controller.firstSubmit.value?
                            AutovalidateMode.disabled:
                            AutovalidateMode.always,
                            controller: controller.firstnameTextController,
                            validator: (String ? value){
                              if(value!.isEmpty){
                                return "Required Field";
                              }
                              return null;
                            },

                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              hintText: 'Enter firstname',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: EdgeInsets.all(20),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset: Offset(0, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Obx(
                              ()=> TextFormField(
                            //   controller: controller.lastnameTextController,
                            autovalidateMode:  !controller.firstSubmit.value?
                            AutovalidateMode.disabled:
                            AutovalidateMode.always,
                            controller: controller.lastnameTextController,

                            validator: (String ? value){
                              if(value!.isEmpty){
                                return "Required Field";
                              }
                              return null;
                            },

                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              hintText: 'Enter lastname',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: EdgeInsets.all(20),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset: Offset(0, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Obx(
                              ()=> TextFormField(
                            //   controller: controller.passwordTextController,
                            autovalidateMode:  !controller.firstSubmit.value?
                            AutovalidateMode.disabled:
                            AutovalidateMode.always,
                            controller: controller.passwordTextController,

                            validator: (String ? value){
                              if(value!.isEmpty){
                                return "Required Field";
                              }
                              if (value.length < 8) {
                                return "Password must be at least 8 characters long";
                              }
                              // Ensure password and confirmation match
                              if (value != controller.confirmationTextController.text) {
                                return "Passwords do not match";
                              }
                            },
                            obscureText: true,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              hintText: 'Enter Passowrd',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: EdgeInsets.all(20),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset: Offset(0, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Obx(
                              ()=> TextFormField(
                            // controller: controller.confirmationTextController,
                            autovalidateMode:  !controller.firstSubmit.value?
                            AutovalidateMode.disabled:
                            AutovalidateMode.always,
                            controller: controller.confirmationTextController,

                            validator: (String ? value){
                              if(value!.isEmpty){
                                return "Required Field";
                              }
                              if (value != controller.passwordTextController.text) {
                                return "Passwords do not match";
                              }
                            },
                            obscureText: true,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              hintText: 'confrim Passowrd',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: EdgeInsets.all(20),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset: Offset(0, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Obx(
                              ()=> TextFormField(
                            // controller: controller.addressTextController,
                            autovalidateMode:  !controller.firstSubmit.value?
                            AutovalidateMode.disabled:
                            AutovalidateMode.always,
                            controller: controller.addressTextController,

                            validator: (String ? value){
                              if(value!.isEmpty){
                                return "Required Field";
                              }
                              return null;
                            },

                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              hintText: 'Enter address',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: EdgeInsets.all(20),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset: Offset(0, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Obx(
                              ()=> TextFormField(
                            //  controller: controller.personalidTextController,
                            autovalidateMode:  !controller.firstSubmit.value?
                            AutovalidateMode.disabled:
                            AutovalidateMode.always,
                            controller: controller.personalidTextController,

                            validator: (String ? value){
                              if(value!.isEmpty){
                                return "Required Field";
                              }
                              return null;
                            },

                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              hintText: 'Enter id',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: EdgeInsets.all(20),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset: Offset(0, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Obx(
                              ()=> TextFormField(
                            //  controller: controller.phoneTextController,
                            autovalidateMode:  !controller.firstSubmit.value?
                            AutovalidateMode.disabled:
                            AutovalidateMode.always,
                            controller: controller.phoneTextController,

                            validator: (String ? value){
                              if(value!.isEmpty){
                                return "Required Field";
                              }
                              return null;
                            },

                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              hintText: 'Enter phone',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: EdgeInsets.all(20),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Obx(()=>controller.registerLoadingState.value?
                      ElevatedButton(
                          onPressed: null,
                          child: SizedBox(width: 20,height: 20,
                            child:CircularProgressIndicator() ,)):
                      ElevatedButton( onPressed: controller.registerLoadingState.value
                          ? null
                          : () {
                        controller.Register();
                      },

                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white, backgroundColor: customColor,
                          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: controller.registerLoadingState.value
                            ? SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(),
                        )
                            : Text('Sign Up'),
                      ),
                      ) ],
                  ),
                ]),
          ),
        ),
      ),*/