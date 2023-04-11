import 'package:flutter/material.dart';

class CTextFeild extends StatelessWidget {
  CTextFeild({
    super.key,
    required TextEditingController emailController,
    required this.heading,
    required this.hintText,
    required this.press,
    required this.inputType,
    this.ispassword = false
  }) : _emailController = emailController;

  final TextEditingController _emailController;
  final String heading;
  final String hintText;
  final String? Function(String?)? press;
  final TextInputType inputType;
  bool ispassword;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(heading),
          TextFormField(
            obscureText: ispassword,
            controller: _emailController,
            decoration: InputDecoration(labelText: hintText,
              labelStyle: TextStyle(
                color: Colors.grey.withOpacity(0.6), // set the alpha value to 0.6 (60% opacity)
              ),
            ),
            keyboardType: inputType,
            validator: press,
          ),
        ],
      ),
    );
  }
}