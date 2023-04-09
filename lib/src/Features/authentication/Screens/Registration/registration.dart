
import 'package:flutter/material.dart';
import 'package:trading_app/src/Constants/Color.dart';

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
  bool _termsAndPrivacyChecked = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Registration",style: Theme.of(context).textTheme.headline3!.copyWith(color: TGreen),),
        centerTitle: true,
        elevation: 0.0,
        leading:  IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_rounded),
          color: TGreen,
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

                    Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Name(as it appers on CNIC)*"),
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
                      ],
                    ),
                  ),

                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Mobile Number*"),
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
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Email(Optinal)"),
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
                            ],
                          ),
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
                        Center(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width*0.3,
                            child: ElevatedButton(

                              onPressed: () {
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
                              child: Text('NEXT',style: TextStyle(color: TGreen)),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: TBgWhite,// background color
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30), // rounded border
                              ),
                            ),
                        ),
                          ),
                        )],
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

