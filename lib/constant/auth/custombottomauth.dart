
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CustomButtomAuth extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final bool isLoading;

  static const Color customColor=Color.fromRGBO(255, 160, 42, 1.0);


  const CustomButtomAuth({Key? key, required this.text,
    this.onPressed,
    this.isLoading = false,
  })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin:const EdgeInsets.only(top: 10),
        child:
        ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(customColor), // Set button color
            // Set button color
            textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(color: Colors.white)), // Text style
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(vertical: 15, horizontal: 40)), // Padding
            elevation: MaterialStateProperty.all<double>(7), // Elevation
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // BorderRadius
              ),
            ),
          ),
          child:
          isLoading
              ? SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          )
              :


          Text(text.tr , style:const TextStyle(fontWeight: FontWeight.bold , fontSize: 16)),
        )

    );
  }
}


