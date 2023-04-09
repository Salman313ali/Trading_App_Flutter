import 'package:flutter/material.dart';
import 'package:trading_app/src/Constants/Color.dart';

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _mobileNumberController = TextEditingController();
  final _emailController = TextEditingController();
  bool _termsAndPrivacyChecked = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 10.0),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 35.0,
                      height: 35.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.0),
                        color: TBgWhite,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 6,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_ios_rounded),
                        color: TGreen,
                        iconSize: 20.0,
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          'REGISTRATION',
                          style: Theme.of(context).textTheme.headline4!.copyWith(color: TGreen,fontWeight:FontWeight.w600)
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.0,),
                Text("Welcome to Zindigi",style: Theme.of(context).textTheme.headline3!.copyWith(color: TGreen),),
                SizedBox(height: 4.0,),
                Text("Let's Start with basic information",style: Theme.of(context).textTheme.headline4,),
                SizedBox(height: 16.0,),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text("Name(as it appers on CNIC)*"),
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: 'Enter Your Name',
                          labelStyle: TextStyle(
                            color: Colors.grey.withOpacity(0.6), // set the alpha value to 0.6 (60% opacity)
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your full name';
                          }
                          return null;
                        },
                      ),

                      TextFormField(
                        controller: _mobileNumberController,
                        decoration: InputDecoration(labelText: 'Mobile Number*',
                          labelStyle: TextStyle(
                            color: Colors.grey.withOpacity(0.6), // set the alpha value to 0.6 (60% opacity)
                          ),
                        ),
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your mobile number';
                          }
                          if (value.length != 11) {
                            return 'Please enter a valid 11-digit mobile number';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(labelText: 'Email',
                          labelStyle: TextStyle(
                            color: Colors.grey.withOpacity(0.6), // set the alpha value to 0.6 (60% opacity)
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email address';
                          }
                          if (!value.contains('@')) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
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
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate() &&
                              _termsAndPrivacyChecked) {
                            // Form is valid and terms and privacy policy are accepted, submit data
                            // TODO: implement registration logic
                          } else if (!_termsAndPrivacyChecked) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Please accept the terms and privacy policy')));
                          }
                        },
                        child: Text('Register'),
                      ),
                    ],
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