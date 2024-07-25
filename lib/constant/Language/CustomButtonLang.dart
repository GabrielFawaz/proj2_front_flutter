import 'package:flutter/material.dart';

class CustomButtonLang extends StatelessWidget {

  final IconData flagIcon;
  final String textbutton;
  final void Function()? onPressed;
  static const Color customColor=Color.fromRGBO(255, 160, 42, 1.0);
  const CustomButtonLang({Key? key, required this.textbutton, this.onPressed,required this.flagIcon}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),

      child:
      Row(
        children: [
          SizedBox(
            width: 200, // Adjust the width as needed
            height: 40,

            child: MaterialButton(

              onPressed: onPressed,
              color: customColor,
             // padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children:[
                  Icon(
                    flagIcon,
                    color: Colors.white, // Change the flag icon color here
                  ),
                  SizedBox(width: 8.0),


                  Text(
                  textbutton,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),]
              ),
            ),
          ),
        ],
      ),
    );

  }
}


/*
class LanguageButtonLang extends StatelessWidget {
  final String languageName;
  final IconData flagIcon;

  const LanguageButtonLang({
    Key? key,
    required this.languageName,
    required this.flagIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Add your action here
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.blue, // Change the button color here
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            flagIcon,
            color: Colors.white, // Change the flag icon color here
          ),
          SizedBox(width: 8.0),
          Text(
            languageName,
            style: TextStyle(
              fontSize: 16.0, // Adjust the font size here
              color: Colors.white, // Change the text color here
            ),
          ),
        ],
      ),
    );
  }
}*/
