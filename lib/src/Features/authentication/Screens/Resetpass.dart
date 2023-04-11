import 'package:flutter/material.dart';
import 'package:trading_app/src/Features/Home/Home.dart';
import 'package:trading_app/src/Features/authentication/Screens/Wigets/Button.dart';
import 'package:trading_app/src/Features/authentication/Screens/Wigets/Text_feild.dart';

import '../../../Constants/Color.dart';
class ResetPass extends StatelessWidget {
   ResetPass({Key? key}) : super(key: key);
  final _ResetFormKey = GlobalKey<FormState>();
  final _newPassController = TextEditingController();
  final _confirmPassController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reset Password",style: Theme.of(context).textTheme.headline3!.copyWith(color: TGreen),),
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(child: Text("Create New Password",style: Theme.of(context).textTheme.headline3,textAlign: TextAlign.center,)),
                SizedBox(height:20.0),
                Form(
                  key: _ResetFormKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CTextFeild(
                          hintText: "New Password",
                          inputType: TextInputType.text,
                          emailController: _newPassController,
                          heading: "Enter New Password",
                          ispassword: true  ,
                          press: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            else if (value.length<8) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                        ),CTextFeild(
                          hintText: "Confirm  Password",
                          inputType: TextInputType.text,
                          emailController: _confirmPassController,
                          heading: "Reenter Password",
                          ispassword: true  ,
                          press: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please confirm your password';
                            }
                            else if (value != _newPassController.text) {
                              return 'password doesn\'t match';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 25.0,),
                        CButton(formKey: _ResetFormKey, width: MediaQuery.of(context).size.width*0.3, press: (){
                          if(_ResetFormKey.currentState!.validate()){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Home(),
                              ),
                            );
                          }
                        }, name: "Continue")
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
