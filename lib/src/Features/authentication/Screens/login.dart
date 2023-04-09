import 'package:flutter/material.dart';
import 'package:trading_app/src/Features/Home/Home.dart';

import '../../../Constants/Color.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final _SigninFormKey = GlobalKey<FormState>();
  final _NumberController = TextEditingController();
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

                Text("Sign in to your account",style: Theme.of(context).textTheme.headline3!.copyWith(color: TGreen),),
                SizedBox(height: 25.0,),

                SingleChildScrollView(
                  child: Form(
                    key: _SigninFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Mobile Number*"),
                              TextFormField(
                                controller: _NumberController,
                                decoration: InputDecoration(labelText: 'Enter Mobile Number*',
                                  labelStyle: TextStyle(
                                    color: Colors.grey.withOpacity(0.6), // set the alpha value to 0.6 (60% opacity)
                                  ),
                                ),
                                keyboardType: TextInputType.phone,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your Mobile number';
                                  }
                                  if (value.length != 11) {
                                    return 'Please enter a valid 11-digit mobie number';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        Center(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width*0.3,
                            child: ElevatedButton(

                              onPressed: () {
                                if (_SigninFormKey.currentState!.validate()) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Home(),
                                    ),
                                  );
                                }
                                else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text('Please insert valid info')));
                                }
                              },
                              child: Text('LOGIN',style: TextStyle(color: TGreen)),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: TBgWhite,// background color
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30), // rounded border
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );;
  }
}
