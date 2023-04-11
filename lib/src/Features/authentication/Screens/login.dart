import 'package:flutter/material.dart';
import 'package:trading_app/src/Features/Home/Home.dart';
import 'package:trading_app/src/Features/authentication/Screens/Wigets/Button.dart';
import 'package:trading_app/src/Features/authentication/Screens/Wigets/Text_feild.dart';

import '../../../Constants/Color.dart';
import 'ForgotPassword.dart';
import 'Registration/registration.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final _SigninFormKey = GlobalKey<FormState>();
  final _NumberController = TextEditingController();
  final _passController = TextEditingController();

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

                Text("Login in to your account",style: Theme.of(context).textTheme.headline3!.copyWith(color: TGreen),),
                SizedBox(height: 25.0,),

                SingleChildScrollView(
                  child: Form(
                    key: _SigninFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        CTextFeild(emailController: _NumberController,
                            heading: "Mobile Number*",
                            hintText: "Enter Mobile Number*",
                            press: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your Mobile number';
                              }
                              if (value.length != 11) {
                                return 'Please enter a valid 11-digit mobie number';
                              }
                              return null;
                            },
                            inputType: TextInputType.number
                        ),


                        Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: CTextFeild(
                                emailController: _passController,
                                heading: "Password",
                                hintText: "Enter Your Password",
                                press: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your password';
                                  }
                                  if (value.length <8) {
                                    return 'Please enter a valid password';
                                  }
                                  return null;
                                },
                                inputType: TextInputType.visiblePassword,
                                ispassword: true ,
                              ),
                            ),

                            Positioned(
                              bottom:-10,
                              right: 0,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>ForgotPass(),
                                    ),
                                  );
                                },
                                child: Text('FORGOT PASSWORD?',style: Theme.of(context).textTheme.headline4!.copyWith(fontSize: 12.0,fontWeight: FontWeight.w600),),
                              ),
                            ),
                            ],
                        ),
                        SizedBox(height: 16.0,),
                        CButton(
                          formKey: _SigninFormKey,
                          width: MediaQuery.of(context).size.width*0.3,
                          press:() {
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
                          name: "LOGIN",
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have account?"),
                            TextButton(onPressed:  () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>RegistrationForm(),
                                ),
                              );
                            },
                                child: Text("SIGN UP"))
                          ],
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
    );
  }
}
