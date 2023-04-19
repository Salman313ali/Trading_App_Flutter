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
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade400,
              ),
              BoxShadow(
                color: TBgWhite,
                spreadRadius: 5.0,
                blurRadius: 10.0,
                offset: Offset(10,7)
              ),
            ], gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment(0, 0),
            colors: [
              Colors.white,
              Colors.white.withOpacity(0.3),
            ],
          ),

            borderRadius: BorderRadius.circular(50.0)
          ),
          child: TextFormField(
            obscureText: ispassword,
            controller: controller,
            decoration: InputDecoration(
                errorStyle: TextStyle(
                    height: 0,
                  fontSize: 0,
                  decoration: null
                ),
              errorMaxLines: 1,
              hintText: hintText,
              hintStyle: TextStyle(
                color: Colors.grey.withOpacity(0.6),
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            ),
            keyboardType: inputType,
            validator: press,
          ),
        ),
        SizedBox(height: 0.02125* size.height,)
      ],
    );
  }
}