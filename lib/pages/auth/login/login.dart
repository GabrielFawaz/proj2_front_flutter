import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:untitled1/pages/auth/register/checkemail.dart';
import '../../../constant/auth/custombottomauth.dart';
import '../../../constant/auth/customtextbodyauth.dart';
import '../../../constant/auth/customtexttitleauth.dart';
import '../../../controllers/login_controller.dart';
import '../../../core/function/alertexitapp.dart';
import '../forgetpassword/sendresetpassword.dart';

//TODO THE OLD LOGIN DESGIN
/*class Login extends GetView<loginController> {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(loginController());
    return Scaffold(
        backgroundColor: Colors.transparent,
        body:
        WillPopScope(
          onWillPop: alertExitApp,
          child: Stack(
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
                            //   const LogoAuth(),
                            const SizedBox(height: 20) ,
                            const CustomTextTitleAuth(text: "2"),
                            const SizedBox(height: 10),
                            const CustomTextBodyAuth(
                                text:
                                "3"),
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
                            SizedBox(height: 20,),
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
                                  controller: controller.PasswordTextController,
                                  autovalidateMode: !controller.firstSubmit.value?
                                  AutovalidateMode.disabled
                                      :AutovalidateMode.always,
                                  validator: (String ? value){
                                    if(value!.isEmpty){
                                      return "Required Field";
                                    }
                                    return null;
                                  },
                                  obscureText: true,
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                    hintText: '',
                                    hintStyle: TextStyle(color: Colors.grey),
                                    suffixIcon: Icon(Icons.lock_outline),
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
                                  controller: controller.checkPasswordTextController,
                                  autovalidateMode: !controller.firstSubmit.value?
                                  AutovalidateMode.disabled
                                      :AutovalidateMode.always,
                                  validator: (String ? value){
                                    if(value!.isEmpty){
                                      return "Required Field";
                                    }
                                    return null;
                                  },
                                  obscureText: true,
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                    hintText: 'checkpassword',
                                    hintStyle: TextStyle(color: Colors.grey),
                                    suffixIcon: InkWell(onTap: (){
                                      controller.checkpassword();
                                    },
                                        child: Icon(Icons.check)),
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


                           SizedBox(height: 15,),
                            InkWell(onTap: (){
                              Get.to(SendResetPassword());

                            },
                              child: Text(
                                "7".tr,
                                textAlign: TextAlign.end,
                              ),
                            ),


                            CustomButtomAuth(text: "4".tr, onPressed: () {
                              controller.login();
                            }),
                            SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("6".tr),
                                InkWell(
                                  onTap: (){
                                    Get.to(Checkemail());
                                  },
                                  child: Text("5".tr,
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontWeight: FontWeight.bold)),
                                ),

                                ])
                              ],
                            )
                        ),
                      )),
                ]),
        ),

    );
  }
}*/




class Login extends GetView<loginController> {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(loginController());
    return Scaffold(
      body: WillPopScope(
        onWillPop:alertExitApp,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0), // Adjust horizontal padding as needed
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
            crossAxisAlignment: CrossAxisAlignment.stretch, // Stretch content horizontally
            children: [
              SizedBox(height: 10), // Top space
              Text(
                "Sign In",
                style: TextStyle(color: Colors.black, fontSize: 35),
                textAlign: TextAlign.center, // Center align the text
              ),
              SizedBox(height: 6), // Space between title and subtitle
              Text(
                "Hii Welcome back, you have been missed",
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
                        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        suffixIcon: Icon(Icons.email, color: Colors.grey), // Email icon on the right side
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
              SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      "Password",
                      style: TextStyle(color: Colors.black, fontSize: 13),
                    ),
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Obx(() => TextFormField(
                      controller: controller.PasswordTextController,
                      autovalidateMode: !controller.firstSubmit.value
                          ? AutovalidateMode.disabled
                          : AutovalidateMode.always,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Required Field";
                        }
                        return null;
                      },
                      obscureText: controller.obscureText.value, // Use obscureText.value to toggle visibility
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        hintText: '',
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
                        suffixIcon: GestureDetector(
                          onTap: () {
                            controller.toggleObscureText(); // Toggle obscureText value
                          },
                          child: Icon(
                            controller.obscureText.value ? Icons.visibility : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    )),
                  ),

                ],
              ),
              SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      "Check Password",
                      style: TextStyle(color: Colors.black, fontSize: 13),
                    ),
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: TextFormField(
                      controller: controller.checkPasswordTextController,
                      autovalidateMode: !controller.firstSubmit.value
                          ? AutovalidateMode.disabled
                          : AutovalidateMode.always,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Required Field";
                        }
                        return null;
                      },
                      obscureText: true,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        hintText: 'Re-enter your password',
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
                        suffixIcon: GestureDetector(
                          onTap: () {
                            controller.checkpassword(); // Call checkPassword method from controller
                          },
                          child: Icon(
                            Icons.check,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(SendResetPassword());
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(
                        "Forget Password",
                        style: TextStyle(
                          color: Color(0xFF003398),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  controller.login();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 43, 116, 254)),
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
                  "Sign In",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 10),
            Column(
              children: [
                // Above content
                SizedBox(height: 20), // Space before divider (adjust as needed)

                // Divider with text
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Divider(
                          color: Colors.grey,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "or sign up with",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                // Below content
                SizedBox(height: 20), // Space after divider (adjust as needed)
              ],
            ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 20,
                      backgroundImage: AssetImage('assets/images/google.png'),
                      foregroundColor: Colors.grey, // Color of the border
                      foregroundImage: AssetImage('assets/images/google.png'),
                    ),
                    SizedBox(width: 20),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 20,
                      backgroundImage: AssetImage('assets/images/facebook.png'),
                      foregroundColor: Colors.grey, // Color of the border
                      foregroundImage: AssetImage('assets/images/facebook.png'),
                    ),
                    SizedBox(width: 20),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 20,
                      backgroundImage: AssetImage('assets/images/apple.png'),
                      foregroundColor: Colors.grey, // Color of the border
                      foregroundImage: AssetImage('assets/images/apple.png'),
                    ),
                  ],
                ),
              ),
           SizedBox(height: 20,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Don't have an account? ",
                      style: TextStyle(color: Colors.black, fontSize: 14),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Sign Up',
                          style: TextStyle(
                            color: Color(0xFF003398),
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                          ..onTap = () {
    Get.to(Checkemail());}

                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Bottom space
            ],
          ),
        ),
      ),
    );
  }
}





/*class Login extends GetView<loginController> {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(loginController());
    Color customColor = Color.fromRGBO(255, 160, 42, 1.0);

    return Scaffold(
      backgroundColor: Colors.transparent,

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/p.jpg"), // Path to your image
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.bottomCenter, // Align the container to the bottom center
        child:
        Container(
          decoration: BoxDecoration(
            color: Colors.white60,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
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
            key:controller.formKey,
            child: Column(
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
                SizedBox(height: 60,),
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
                SizedBox(height: 20,),
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
                      controller: controller.PasswordTextController,
                      autovalidateMode: !controller.firstSubmit.value?
                      AutovalidateMode.disabled
                          :AutovalidateMode.always,
                      validator: (String ? value){
                        if(value!.isEmpty){
                          return "Required Field";
                        }
                        return null;
                      },
                      obscureText: true,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        hintText: 'Enter Password',
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

                Row(
                  children: [
                    Obx(
                          ()=>controller.loginLoadingState.value?
                      ElevatedButton(
                          onPressed: null,
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(customColor), // Set button color
                            textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(color: Colors.white)), // Text style
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
                            controller.login();
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(customColor), // Set button color
                            textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(color: Colors.white)), // Text style
                            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(vertical: 15, horizontal: 40)), // Padding
                            elevation: MaterialStateProperty.all<double>(7), // Elevation
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10), // BorderRadius
                              ),
                            ),
                          ),
                          child: Text('Sign In')
                      ),
                    ),
                    SizedBox(width: 30,),
                    ElevatedButton(
                      onPressed: () {
                        Get.to(() => ResetPassword());

                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(customColor), // Set button color
                        textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(color: Colors.white)), // Text style
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(vertical: 15, horizontal: 40)), // Padding
                        elevation: MaterialStateProperty.all<double>(7), // Elevation
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10), // BorderRadius
                          ),
                        ),
                      ),
                      child: Text('Forget password'),
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}*/
