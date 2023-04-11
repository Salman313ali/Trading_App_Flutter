
import 'package:flutter/material.dart';
import 'package:trading_app/src/Constants/Color.dart';

import '../Wigets/Button.dart';
import '../Wigets/Text_feild.dart';
import 'cnic.dart';

class RegistrationForm extends StatefulWidget {
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

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Registration",style: Theme.of(context).textTheme.headline3!.copyWith(color: TWhite),),
        centerTitle: true,
        elevation: 0.0,
        leading:  IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_rounded),
          color: TWhite,
          iconSize: 25.0,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(

            padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 10.0),

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text("Welcome to Zindigi",style: Theme.of(context).textTheme.headline3!.copyWith(color: TGreen),),
                SizedBox(height: 4.0,),
                Text("Let's Start with basic information",style: Theme.of(context).textTheme.headline4,),
                SizedBox(height: 25.0,),

                SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        CTextFeild(
                            emailController: _nameController,
                            heading: "Name(as is Appers on CNIC)*",
                            hintText: "Enter you name",
                            press: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your full name';
                              }
                              return null;
                            },
                          inputType: TextInputType.text,
                        ),
                        CTextFeild(emailController: _mobileNumberController,
                      heading: "Mobile Number*",
                      hintText: "Mobile number",
                      press:  (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your mobile number';
                      }
                      if (value.length != 11) {
                        return 'Please enter a valid 11-digit mobile number';
                      }
                      return null;
                    },
                        inputType: TextInputType.number,
                      ),
                        CTextFeild(
                          emailController: _emailController,
                          hintText: "Email",heading: "Email(Optional)",
                          press: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email address';
                            }
                            if (!value.contains('@')) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                          inputType: TextInputType.emailAddress,
                        ),
                        CTextFeild(
                          emailController: _passController,
                          hintText: "password",heading: "Create Password",
                          press: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            else if (value.length<8) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                          inputType: TextInputType.visiblePassword,
                          ispassword: true,
                        ),
                        CTextFeild(
                          emailController: _confirmPassController,
                          hintText: "Confirm Password",heading: "re-enter password",
                          press: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please confirm your password';
                            }
                            else if (value != _passController.text) {
                              return 'password doesn\'t match';
                            }
                            return null;
                          },
                          inputType: TextInputType.visiblePassword,
                          ispassword: true,

                        ),
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
                        const SizedBox(height: 16),
                        CButton(
                          name: "Next",
                            formKey: _formKey,
                            termsAndPrivacyChecked: _termsAndPrivacyChecked,
                          width: MediaQuery.of(context).size.width*0.3,
                          press: () {
                            if (_formKey.currentState!.validate() &&
                                _termsAndPrivacyChecked) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CnicForm(),
                                ),
                              );
                            } else if (!_termsAndPrivacyChecked) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Please accept the terms and privacy policy')));
                            }
                          },
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




