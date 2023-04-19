
import 'package:flutter/material.dart';
import 'package:pixel_perfect/pixel_perfect.dart';
import 'package:trading_app/src/Constants/Color.dart';
import 'package:trading_app/src/Features/Home/Home.dart';

import '../Wigets/Button.dart';
import '../Wigets/Text_feild.dart';
import 'CreatePass.dart';
import 'cnic.dart';

const mockupHeight = 1600;
const mockupWidth = 757;

class RegistrationForm extends StatefulWidget {

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _mobileNumberController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _mobileNumberController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _confirmPassController = TextEditingController();
  bool _termsAndPrivacyChecked = false;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scale = mockupWidth/size.width;
    final textScale = size.width/mockupWidth;
    String errorText = "";
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: TBgWhite,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal:44.0/mockupWidth* size.width , vertical: 34.0/mockupHeight* size.height),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom:34.0/mockupHeight* size.height),
                  height: 64.0/mockupHeight* size.height,
                  width: size.width,
                  color: TBgWhite,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Text(
                        "REGISTRATION",
                        style: Theme.of(context).textTheme.headline3!.copyWith(color:TGreen),
                        textScaleFactor: textScale,
                      ),
                      Positioned(
                        left: 0,
                          child:
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              color: TGreen,
                              icon: const Icon(Icons.navigate_before),
                              iconSize: 64.0/mockupHeight* size.height,

                              padding: EdgeInsets.only(left: 7.0/ mockupWidth* size.width),
                              style: const ButtonStyle(
                                padding: MaterialStatePropertyAll(EdgeInsets.all(10.0)),
                                backgroundColor: MaterialStatePropertyAll(Colors.red),
                              ),
                          ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 70.0/mockupHeight* size.height,),
                Container(
                  width: size.width,
                  padding: EdgeInsets.only(bottom:50.0/mockupHeight* size.height ),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "Welcome to Zindigi",
                          style: Theme.of(context).textTheme.headline1!.copyWith(color:TGreen),
                          textScaleFactor: textScale,
                      ),
                      SizedBox(height: 25.0/mockupHeight* size.height,),
                      Text(
                          "Let’s start with basic information.",
                          style: Theme.of(context).textTheme.headline2,
                          textScaleFactor: textScale,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: size.width,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        CTextFeild(
                            controller: _nameController,
                            heading: "Name(as it appers on CNIC)*",
                            hintText: "Enter Your Name",
                            press: (value) {
                              if (value == null || value.isEmpty) {
                                errorText  = 'Please enter your full name';
                                return '';
                              }
                              return null;
                            },
                            inputType: TextInputType.text),
                        CTextFeild(
                            controller: _mobileNumberController,
                            heading: "Mobile Number",
                            hintText: "Enter Your Mobile Number",
                            press: (value) {
                              if (value == null || value.isEmpty) {
                                errorText = "Please enter your mobile number";
                                return '';
                                // return 'Please enter your mobile number';
                              }
                              if (value.length != 11) {
                                errorText = "Please enter a valid 11-digit mobile number";
                                return '';
                              }
                              return null;
                            },
                            inputType: TextInputType.text),
                        CTextFeild(
                            controller: _emailController,
                            heading: "Email (Optional)",
                            hintText: "Enter email",
                            press: (value) {
                              if (value == null || value.isEmpty) {
                                errorText = 'Please enter your email address';
                                return'';
                              }
                              if (!value.contains('@')) {
                                errorText = 'Please enter a valid email address';
                                return'';
                              }
                              return null;
                            },
                            inputType: TextInputType.text
                        ),
                        SizedBox(height: 25.0/mockupHeight* size.height,),
                        Row(
                          children: [
                            Checkbox(
                              value: _termsAndPrivacyChecked,
                              onChanged: (newValue) {
                                setState(() {
                                  _termsAndPrivacyChecked = newValue!;
                                });
                              },
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Text('I agree to the '),
                                  Text(
                                    'terms and privacy policy',
                                    style: TextStyle(
                                      color: TGreen,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 75.0/mockupHeight* size.height,),
                        CButton(formKey: _formKey,
                            width: 310.0/mockupWidth* size.width,
                          press: () {
                            if(!(_formKey.currentState!.validate()) && _termsAndPrivacyChecked){
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(errorText),
                                      duration: Duration(seconds: 1),));
                            }
                            if ((_formKey.currentState!.validate()) &&
                                _termsAndPrivacyChecked) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CreatePass(),
                                ),
                              );
                            } else if (!_termsAndPrivacyChecked) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Please accept the terms and privacy policy')));
                                      // content: Text('Please accept the terms and privacy policy')));
                            }
                          },
                          name: "Next",
                          termsAndPrivacyChecked:  _termsAndPrivacyChecked,
                          height: 75.0/mockupHeight* size.height,
                        ),

                      ],
                    ),
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




