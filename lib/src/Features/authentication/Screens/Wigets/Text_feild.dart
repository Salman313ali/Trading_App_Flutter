import 'package:flutter/material.dart';

import '../../../../Constants/Color.dart';

class CTextFeild extends StatelessWidget {
  CTextFeild({
    super.key,
    required this.controller,
    required this.heading,
    required this.hintText,
    required this.press,
    required this.inputType,
    this.ispassword = false
  }) ;

  final TextEditingController controller;

  final String heading;
  final String hintText;
  final String? Function(String?)? press;
  final TextInputType inputType;

  bool ispassword;

  @override
  Widget build(BuildContext context) {
  final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            heading,
          style: Theme.of(context).textTheme.headline2,
          textScaleFactor: size.width/757,
        ),
        SizedBox(height: 0.014375 * size.height,),
          TextFormField(
            obscureText: ispassword,
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                color: Colors.grey.withOpacity(0.6), // set the alpha value to 0.6 (60% opacity)
              ),
              border: OutlineInputBorder(

                borderRadius: BorderRadius.circular(50),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: TGreen),
                borderRadius: BorderRadius.circular(50),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: TGreen),
                borderRadius: BorderRadius.circular(50),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: TGreen),
                borderRadius: BorderRadius.circular(50),
              ),

            ),
            keyboardType: inputType,
            validator: press,
          ),
        SizedBox(height: 0.02125* size.height,)
      ],
    );
  }
}