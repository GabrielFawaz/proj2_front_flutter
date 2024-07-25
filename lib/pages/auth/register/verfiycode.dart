import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:untitled1/pages/auth/Register/register1.dart';
import 'package:http/http.dart' as http;

import '../../../constant/auth/custombottomauth.dart';
import '../../../constant/auth/customtextbodyauth.dart';
import '../../../constant/auth/customtexttitleauth.dart';
import '../../../constant/color.dart';
import '../../../controllers/verfiycode_controller.dart';
import '../../../repository/checkemail_repo.dart';

/*
class VerfiyCode extends GetView<VerfiyCodeController> {
  const VerfiyCode({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerfiyCodeController());
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
                      CustomTextTitleAuth(text: "24"),
                      const SizedBox(height: 17),
                      CustomTextBodyAuth(text: "25"),
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
                            controller: controller.numberTextController,
                            autovalidateMode: !controller.firstSubmit.value?
                            AutovalidateMode.disabled:
                            AutovalidateMode.always,
                            validator: (String?value){
                              if(value!.isEmpty){
                                return "Required Field";
                              }
                              return null;
                            },

                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              hintText: '14'.tr,
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

                      ElevatedButton(onPressed: () async {
                        // var response = await http.post(
                        //   Uri.parse("http://192.168.1.110:8000/api/register/code"),
                        //   headers: {
                        //     // 'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL2xvZ2luIiwiaWF0IjoxNjg4MTU4MDY4LCJleHAiOjE2ODgxNjE2NjgsIm5iZiI6MTY4ODE1ODA2OCwianRpIjoiNWV1bGxwUE5KOVJqaGpRaCIsInN1YiI6IjIiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.PVSbBmnk68xPDpHBbzunLICybCDK-RGQqvRdb_adJO8',
                        //     'Content-Type': 'application/json',
                        //     'Cookie': CheckEmailRepo.cookies!.first,
                        //   },
                        //   body: jsonEncode(
                        //       {
                        //         "verification_code": controller.numberTextController.text,
                        //   }
                        //   ),
                        //
                        // );
                        // var js = jsonDecode(response.body);
                        //
                        // print(js);
                        print(controller.numberTextController.text);
                        controller.verfiycode(controller.numberTextController.text);

                      },
                          child:Text("26".tr)),




                    ]),
                  ),
                ),
              ),

            ]
        )

    );


  }
}
*/




class VerfiyCode extends GetView<VerfiyCodeController> {
  const VerfiyCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(VerfiyCodeController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Verify Code"),
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
                SizedBox(height: 50),
                Text(
                  "Enter Verification Code",
                  style: TextStyle(color: Colors.black, fontSize: 24),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  "Please enter the verification code sent to your email",
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: OtpTextField(
                    numberOfFields: 6,
                    borderColor: Colors.grey,
                    fieldWidth: 40.0,
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    onCodeChanged: (String code) {
                      // Handle code changes
                    },
                    onSubmit: (String verificationCode) {
                      // Store the OTP code in the controller
                      controller.otpCode.value = verificationCode;
                    },
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    controller.verifyCode(); // Call the verification method
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>( Color(0xFF2B74FE)),
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
                    "Verify",
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



//THE PREVOUIS DESGIN
/*
      Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Form(
          key:controller.formKey,
          child: ListView(children: [
            const SizedBox(height: 20),
            const CustomTextTitleAuth(text: "Check code"),
            const SizedBox(height: 10),
            const CustomTextBodyAuth(
                text:
                "Please Enter Your Email Address To Recive a Verification Code"),
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
                    ()=>TextFormField(
                  controller: controller.numberTextController,
                  autovalidateMode: !controller.firstSubmit.value?
                  AutovalidateMode.disabled:
                  AutovalidateMode.always,
                  validator: (String?value){
                    if(value!.isEmpty){
                      return "Required Field";
                    }
                    return null;
                  },

                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: 'Enter code',
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

            ElevatedButton(onPressed: () async {
              var response = await http.post(
                Uri.parse("http://192.168.1.110:8000/api/register/code"),
                headers: {
                  // 'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL2xvZ2luIiwiaWF0IjoxNjg4MTU4MDY4LCJleHAiOjE2ODgxNjE2NjgsIm5iZiI6MTY4ODE1ODA2OCwianRpIjoiNWV1bGxwUE5KOVJqaGpRaCIsInN1YiI6IjIiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.PVSbBmnk68xPDpHBbzunLICybCDK-RGQqvRdb_adJO8',
                  'Content-Type': 'application/json',
                  'Cookie': CheckEmailRepo.cookies!.first,
                },
                body: jsonEncode(
                    {
                      "verification_code": controller.numberTextController.text,
                }
                ),

              );
              var js = jsonDecode(response.body);

              print(js);
              print(controller.numberTextController.text);
              controller.verfiycode(controller.numberTextController.text);

            },
                child:Text("checkecode")),
            // CustomButtomAuth(text: "Check", onPressed: () {
            // controller.goToVerfiyCode();
            //}),
            const SizedBox(height: 40),

          ]),
        ),
      ),
*/
