import 'package:flutter/material.dart';
import 'package:trading_app/src/Features/Home/Home.dart';
import 'package:trading_app/src/Features/authentication/Screens/Wigets/Button.dart';
import 'package:trading_app/src/Features/authentication/Screens/Wigets/Text_feild.dart';

import '../../../Constants/Color.dart';
import 'ForgotPassword.dart';
import 'Registration/OTP.dart';
import 'Registration/registration.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final _SigninFormKey = GlobalKey<FormState>();
  final _NumberController = TextEditingController();
  final _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textScale = size.width/mockupWidth;
    String errorText = "";
    return SafeArea(
      child: Scaffold(
        backgroundColor: TBgWhite,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal:44.0/757* size.width , vertical: 34.0/1600* size.height),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                        "LOG IN",
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

                Text(
                  "Login in to your account",
                  style: Theme.of(context).textTheme.headline1!.copyWith(color: TGreen),
                  textScaleFactor: textScale,
                ),
                SizedBox(height: 70.0/mockupHeight*size.height,),

                SingleChildScrollView(
                  child: Form(
                    key: _SigninFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        CTextFeild(controller: _NumberController,
                            heading: "Mobile Number*",
                            hintText: "Enter Mobile Number*",
                            press: (value) {
                              if (value == null || value.isEmpty) {
                                errorText = 'Please enter your Mobile number';
                                return '';
                              }
                              if (value.length != 11) {
                                errorText = 'Please enter a valid 11-digit mobie number';
                                return '';
                              }
                              return null;
                            },
                            inputType: TextInputType.number
                        ),

                        Text(
                          "PIN",
                          style: Theme.of(context).textTheme.headline2,
                          textScaleFactor: textScale,
                        ),
                        Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 30.0,left: 40.0,right: 40.0),
                              child: Row(

                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  COTPInput(),
                                  COTPInput(),
                                  COTPInput(),
                                  COTPInput(),
                                ],
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
                                child: Text('FORGOT PIN?',style: Theme.of(context).textTheme.headline4!.copyWith(fontSize: 12.0,fontWeight: FontWeight.w600),),
                              ),
                            ),
                            ],
                        ),
                        SizedBox(height: 16.0,),
                        CButton(
                          height: 75.0/mockupHeight* size.height,
                          formKey: _SigninFormKey,
                          width:310.0/mockupWidth* size.width,
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
                                  SnackBar(content: Text(errorText),
                                  duration: Duration(seconds: 1),));
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
