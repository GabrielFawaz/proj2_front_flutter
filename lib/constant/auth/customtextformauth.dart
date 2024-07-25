import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String hinttext;
  final String labeltext;
  final IconData iconData;
  final TextEditingController? mycontroller;
  final String? Function(String?) valid;
  final bool isNumber;
  final bool? obsecureText;
  final void Function()? onTapIcon;

  const CustomTextFormAuth(
      {Key? key,
        required this.hinttext,
        required this.labeltext,
        required this.iconData,
        this.mycontroller,
        required this.valid,
        required this.isNumber,
        this.obsecureText,
        this.onTapIcon,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
      margin: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        keyboardType: isNumber
            ? const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        validator: valid,
        controller: mycontroller,
        obscureText:obsecureText== null || obsecureText==false ? false :true ,
        decoration: InputDecoration(
          hintText: hinttext,
          hintStyle: const TextStyle(fontSize: 14,color: Colors.grey),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: EdgeInsets.all(20),
          //contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),

          /*label: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 9),
                  child: Text(labeltext)),*/
          suffixIcon: InkWell(
              onTap: onTapIcon,
              child: Icon(iconData)),
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),

        ),
      ),

    );
  }
}