import 'package:flutter/material.dart';
import 'package:trading_app/src/Features/authentication/Screens/Wigets/Button.dart';
import 'package:trading_app/src/Features/authentication/Screens/Wigets/Text_feild.dart';

import '../../../Constants/Color.dart';
import 'Registration/OTP.dart';
class ForgotPass extends StatelessWidget {
   ForgotPass({Key? key}) : super(key: key);
  final _mobileController = TextEditingController();
  final _resetFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RESET LOGIN PIN",style: Theme.of(context).textTheme.headline3!.copyWith(color: TWhite),),
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
            padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Reset Login password",style: Theme.of(context).textTheme.headline3!.copyWith(color: TGreen),),
                SizedBox(height: 25.0,),
              Form(
                key: _resetFormKey,
                  child: Column(
                    children: [
                      CTextFeild(emailController: _mobileController,
                          heading: "Mobile Number",
                          hintText: "Enter Mobile Numer",
                          press: (value){
                            if (value == null || value.isEmpty) {
                              return 'Please enter your mobile number';
                            }
                            if (value.length != 11) {
                              return 'Please enter a valid 11-digit mobile number';
                            }
                            return null;
                          },
                          inputType: TextInputType.number),
                      CButton(formKey: _resetFormKey, width: MediaQuery.of(context).size.width*0.3,
                          press: () {
                            if (_resetFormKey.currentState!.validate()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EnterOTP(),
                                ),
                              );
                            }
                          },
                          name: "Send Code")
                    ],
                  )
              ),
            ],
            ),
          ),
        ),
      ),
    );
  }
}
