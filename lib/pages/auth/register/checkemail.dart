import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constant/auth/custombottomauth.dart';
import '../../../constant/auth/customtextbodyauth.dart';
import '../../../constant/auth/customtextformauth.dart';
import '../../../constant/auth/customtexttitleauth.dart';
import '../../../constant/color.dart';
import '../../../controllers/checkemail_controlller.dart';
import 'package:http/http.dart' as http;


//basheeralkhiat86
/*class Checkemail extends GetView<CheckemailController>  {
  const Checkemail ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CheckemailController());
    return Scaffold(

      body:
      Stack(
          children: [
            // Background Image
            Positioned.fill(
                child: Container(
                  color: Colors.black, // Change this to the color you want
                )
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white70,
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
                child: Form(
                  key: controller.formKey,
                  child: ListView(children: [
                    const SizedBox(height: 100),
                    CustomTextTitleAuth(text: "5"),
                    const SizedBox(height: 17),
                    CustomTextBodyAuth(text: "10"),
                    const SizedBox(height: 30),
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
                            ()=>TextFormField(
                          controller: controller.usernameTextController,
                          autovalidateMode: !controller.firstSubmit.value?
                          AutovalidateMode.disabled:
                          AutovalidateMode.always,
                          validator: (String?value){
                            if(value!.isEmpty){
                              return "Required Field";
                            }else if(!GetUtils.isEmail(value)){
                              return "Wrong Email";
                            }
                            return null;
                          },

                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            hintText: '8'.tr,
                            hintStyle: TextStyle(color: Colors.grey),
                            suffixIcon: Icon(Icons.email_outlined),

                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.all(20),
                          ),
                        ),
                      ),
                    ),
                      SizedBox(height: 30,),
                    Row(
                      children: [
                        CustomButtomAuth(text: "11", onPressed: () {
                          print("1 aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
                          controller.Checkemail();}),

                        SizedBox(width: 20,),

                      ],
                    ),

                  ]),
                ),
              ),
            ),

          ]
      )
    );
  }
}*/
 // Adjust the import based on your file structure


import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Checkemail extends GetView<CheckemailController> {
  const Checkemail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CheckemailController());

    return Scaffold(
      appBar: AppBar(
        title: Text("Check Email"),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 50), // Reduced top space
                Text(
                  "Check Email",
                  style: TextStyle(color: Colors.black, fontSize: 35),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10), // Space below title
                Text(
                  "Enter your email to proceed",
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30), // Space below subtitle
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child:
                  TextFormField(
                    controller: controller.usernameTextController,
                    autovalidateMode: !controller.firstSubmit.value
                        ? AutovalidateMode.disabled
                        : AutovalidateMode.always,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Required Field";
                      } else if (!GetUtils.isEmail(value)) {
                        return "Wrong Email";
                      }
                      return null;
                    },
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      hintText: 'Enter your email',
                      hintStyle: TextStyle(color: Colors.grey),
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      suffixIcon: Icon(Icons.email, color: Colors.grey),
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
                SizedBox(height: 20), // Space below text field
                ElevatedButton(
                  onPressed: () {
                    controller.Checkemail(); // Call the checkEmail method from the controller
                  },
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>( Color(0xFF2B74FE)),
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    ),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  child: Text(
                    "Check Email",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}









/*
 Get.put(CheckemailController());

body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Form(
          key:controller.formKey,
          child: ListView(children: [
            const SizedBox(height: 20),
            const CustomTextTitleAuth(text: "Check Email"),
            const SizedBox(height: 25),
            const CustomTextBodyAuth(
                text:
                "Please Enter Your Email Address To Recive a Verification Code"),
            const SizedBox(height: 20),
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
                    ()=>TextFormField(
                  controller: controller.usernameTextController,
                  autovalidateMode: !controller.firstSubmit.value?
                  AutovalidateMode.disabled:
                  AutovalidateMode.always,
                  validator: (String?value){
                    if(value!.isEmpty){
                      return "Required Field";
                    }else if(!GetUtils.isEmail(value)){
                      return "Wrong Email";
                    }
                    return null;
                  },

                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: 'Enter Email',
                    hintStyle: TextStyle(color: Colors.grey),
                    suffixIcon: Icon(Icons.email_outlined),

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

            Row(
              children: [
                ElevatedButton(onPressed: (){
                  controller.Checkemail();
                  },child:Text("checkemail")),
                    SizedBox(width: 20,),
                ElevatedButton(onPressed: (){
                  Get.toNamed('/ResetPassword ');                },
                    child:Text("ForgetPaasowrd")),

              ],
            ),
           // CustomButtomAuth(text: "Check", onPressed: () {
             // controller.goToVerfiyCode();
            //}),
            const SizedBox(height: 40),

          ]),
        ),
      ),*/



//  var response = await http.post(
//Uri.parse("http://192.168.1.5:8000/api/register/email"),
//  headers: {
// 'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL2xvZ2luIiwiaWF0IjoxNjg4MTU4MDY4LCJleHAiOjE2ODgxNjE2NjgsIm5iZiI6MTY4ODE1ODA2OCwianRpIjoiNWV1bGxwUE5KOVJqaGpRaCIsInN1YiI6IjIiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.PVSbBmnk68xPDpHBbzunLICybCDK-RGQqvRdb_adJO8',
//  'Content-Type': 'application/json',
//'Cookie': CheckEmailRepo.cookies!.first,
//   },
//body: jsonEncode(
// {
//  "email": "basheeralkhiat86@gmail.com" ,
//  }
//   ),

//  );
// var js = jsonDecode(response.body);

//  print(js);

// }),