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
    final size = MediaQuery.of(context).size;
    final textScale = size.width/757;
    String errorText= "";
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
                  margin: EdgeInsets.only(bottom:34.0/1600* size.height),
                  height: 64.0/1600* size.height,
                  width: size.width,
                  color: TBgWhite,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Text(
                        "FORGET PASSWORD",
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
                          iconSize: 64.0/1600* size.height,

                          padding: EdgeInsets.only(left: 7.0/ 757* size.width),
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
                  "Reset Login password",
                  style: Theme.of(context).textTheme.headline1!.copyWith(color: TGreen),
                  textScaleFactor: textScale,
                ),
                SizedBox(height: 25.0,),
              Form(
                key: _resetFormKey,
                  child: Column(
                    children: [
                      CTextFeild(controller: _mobileController,
                          heading: "Mobile Number",
                          hintText: "Enter Mobile Numer",
                          press: (value){
                            if (value == null || value.isEmpty) {
                              errorText = 'Please enter your mobile number';
                              return '';
                            }
                            if (value.length != 11) {
                              errorText = 'Please enter a valid 11-digit mobile number';
                              return '';
                            }
                            return null;
                          },
                          inputType: TextInputType.number),
                      SizedBox(height: 75.0/1600* size.height,),
                      CButton(
                        formKey: _resetFormKey,
                        width: 310.0/757* size.width,
                          press: () {
                            if (_resetFormKey.currentState!.validate()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EnterOTP(),
                                ),
                              );
                            }
                            else{
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(errorText),
                                    duration: Duration(seconds: 1),));
                            }
                          },
                          name: "Send Code",
                        height: 75.0/1600* size.height,
                      )
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
