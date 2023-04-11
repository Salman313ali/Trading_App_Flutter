import 'package:flutter/material.dart';

import '../../../../Constants/Color.dart';

class CButton extends StatelessWidget {
  CButton({
    super.key,
    required this.formKey,
    this.termsAndPrivacyChecked = false,
    this.color = TGreen,
    this.bgcolor = TBgWhite,
    required this.width,
    required this.press,
    required this.name ,
  }) ;

  final GlobalKey<FormState> formKey;
  bool termsAndPrivacyChecked;
  final double width;
  final Function()? press;
  final String name;
  Color color;
  Color bgcolor;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width,
        child: ElevatedButton(

          onPressed: press,
          child: Text(name,style: TextStyle(color: color)),
          style: ElevatedButton.styleFrom(
            backgroundColor: bgcolor,// background color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30), // rounded border
            ),
          ),
        ),
      ),
    );
  }
}