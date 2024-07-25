import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../constant/auth/custombottomauth.dart';
import '../../../constant/auth/customtextbodyauth.dart';
import '../../../constant/auth/customtexttitleauth.dart';
import '../../../controllers/sendresetpassword_contoller.dart';
import '../../../core/function/alertexitapp.dart';

/*
class SendResetPassword extends GetView<SendResetPasswordController> {
  const SendResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SendResetPasswordController());
    Color customColor = Color.fromRGBO(255, 160, 42, 1.0);

    return Scaffold(
      backgroundColor: Colors.transparent,

      body:
      Container(
        child:
        Container(
          padding: EdgeInsets.all(20),
          child: Form(
            key:controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.all(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Obx(()=>controller.loginLoadingState.value?
                      ElevatedButton(
                          onPressed: null,
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(customColor), // Set button color
                           // textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(color: Colors.white)), // Text style
                            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(vertical: 15, horizontal: 40)), // Padding
                            elevation: MaterialStateProperty.all<double>(7), // Elevation
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10), // BorderRadius
                              ),
                            ),
                          ),
                          child:SizedBox(width: 20,height: 20,child: CircularProgressIndicator(),)
                      ):
                      ElevatedButton(
                          onPressed: () {
                            controller.resetpassword();
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(customColor), // Set button color
                           // textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(color: Colors.white)), // Text style
                            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(vertical: 15, horizontal: 40)), // Padding
                            elevation: MaterialStateProperty.all<double>(7), // Elevation
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10), // BorderRadius
                              ),
                            ),
                          ),
                          child: Text('Reset Password')
                      ),
                    ),

                    ]),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
*/

//basheeralkhiat86
class SendResetPassword extends GetView<SendResetPasswordController> {
  const SendResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SendResetPasswordController());
    // return Scaffold(
    //     body:
    //     Stack(
    //         children: [
    //           // Background Image
    //           Positioned.fill(
    //               child: Container(
    //                 color: Colors.black, // Change this to the color you want
    //               )
    //           ),
    //           Container(
    //             padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
    //             alignment: Alignment.bottomCenter,
    //             child: Container(
    //               decoration: BoxDecoration(
    //                 color: Colors.white70,
    //                 borderRadius: BorderRadius.only(
    //                   topLeft: Radius.circular(10.0),
    //                   topRight: Radius.circular(10.0),
    //                   bottomLeft: Radius.circular(0.0), // Adjust this value as needed
    //                   bottomRight: Radius.circular(0.0), // Adjust this value as needed
    //                 ),
    //                 boxShadow: [
    //                   BoxShadow(
    //                     color: Colors.black.withOpacity(0.5),
    //                     spreadRadius: 5,
    //                     blurRadius: 7,
    //                     offset: Offset(0, 3), // changes position of shadow
    //                   ),
    //                 ],
    //               ),
    //               width: MediaQuery.of(context).size.width / 1,
    //               height: MediaQuery.of(context).size.width / 0.5,
    //               padding: EdgeInsets.all(20),
    //               child: Form(
    //                 key: controller.formKey,
    //                 child: ListView(children: [
    //                   const SizedBox(height: 100),
    //                   CustomTextTitleAuth(text: "7"),
    //                   const SizedBox(height: 17),
    //                   Text(
    //                     "12".tr,
    //                     style: TextStyle(color: Colors.grey, fontSize: 15),
    //                     textAlign: TextAlign.center, // Center align the text
    //                   ),                      const SizedBox(height: 30),
    //                   Container(
    //                     decoration: BoxDecoration(
    //                       color: Colors.white,
    //                       borderRadius: BorderRadius.circular(10),
    //                       boxShadow: [
    //                         BoxShadow(
    //                           color: Colors.black.withOpacity(0.5),
    //                           spreadRadius: 3,
    //                           blurRadius: 5,
    //                           offset: Offset(0, 2), // changes position of shadow
    //                         ),
    //                       ],
    //                     ),
    //                     child: Obx(
    //                           ()=>TextFormField(
    //                         controller: controller.usernameTextController,
    //                         autovalidateMode: !controller.firstSubmit.value?
    //                         AutovalidateMode.disabled:
    //                         AutovalidateMode.always,
    //                         validator: (String?value){
    //                           if(value!.isEmpty){
    //                             return "Required Field";
    //                           }else if(!GetUtils.isEmail(value)){
    //                             return "Wrong Email";
    //                           }
    //                           return null;
    //                         },
    //
    //                         style: TextStyle(color: Colors.black),
    //                         decoration: InputDecoration(
    //                           hintText: '8'.tr,
    //                           fillColor: Colors.grey.shade200,
    //                           hintStyle: TextStyle(color: Colors.grey),
    //                           suffixIcon: Icon(Icons.email_outlined,color: Colors.grey,),
    //
    //                           border: OutlineInputBorder(
    //                             borderRadius: BorderRadius.circular(10),
    //                             borderSide: BorderSide.none,
    //                           ),
    //                           contentPadding: EdgeInsets.all(20),
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                   SizedBox(height: 30,),
    //                   Row(
    //                     children: [
    //
    //
    //                       ElevatedButton(
    //                         onPressed: () {
    //                           controller.resetpassword();
    //                         },
    //                         style: ButtonStyle(
    //                           backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF003398)),
    //                           foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
    //                           padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
    //                             EdgeInsets.symmetric(vertical: 15, horizontal: 20), // Adjust padding as needed
    //                           ),
    //                           shape: MaterialStateProperty.all<OutlinedBorder>(
    //                             RoundedRectangleBorder(
    //                               borderRadius: BorderRadius.circular(10),
    //                             ),
    //                           ),
    //                         ),
    //                         child: Text(
    //                           "12".tr,
    //                           style: TextStyle(fontSize: 16),
    //                         ),
    //                       ),
    //                       SizedBox(width: 20,),
    //
    //                     ],
    //                   ),
    //
    //                 ]),
    //               ),
    //             ),
    //           ),
    //
    //         ]
    //     )
    // );
    return Scaffold(
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 16.0), // Adjust horizontal padding as needed
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Center content vertically
            crossAxisAlignment:
                CrossAxisAlignment.stretch, // Stretch content horizontally
            children: [
              SizedBox(height: 10), // Top space
              Text(
                "12".tr,
                style: TextStyle(color: Colors.black, fontSize: 35),
                textAlign: TextAlign.center, // Center align the text
              ),
              SizedBox(height: 6), // Space between title and subtitle
              Text(
                "7".tr,
                style: TextStyle(color: Colors.grey, fontSize: 15),
                textAlign: TextAlign.center, // Center align the text
              ),
              SizedBox(height: 50), // Space below subtitle
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      "Email",
                      style: TextStyle(color: Colors.black, fontSize: 13),
                    ),
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: TextFormField(
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
                        hintText: '8'.tr,
                        hintStyle: TextStyle(color: Colors.grey),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        suffixIcon: Icon(Icons.email,
                            color: Colors.grey), // Email icon on the right side
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
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      controller.resetpassword();
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xFF003398)),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 20), // Adjust padding as needed
                      ),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    child: Text(
                      "12".tr,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),

              // Bottom space
            ],
          ),
        ),
      ),
    );
  }
}

/*body: Container(
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
