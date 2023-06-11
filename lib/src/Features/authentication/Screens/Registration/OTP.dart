import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trading_app/src/Features/authentication/Screens/Wigets/Button.dart';


import '../../../../Constants/Color.dart';
import '../Resetpass.dart';

class EnterOTP extends StatelessWidget {
  EnterOTP({Key? key}) : super(key: key);
  final _OTPFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textScale = size.width/757;
    return SafeArea(
      child: Scaffold(
        backgroundColor: TBgWhite,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal:44.0/757* size.width , vertical: 34.0/1600* size.height),
            child: Column(
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
                  "Enter the OTP received on your mobile number",
                  style: Theme.of(context).textTheme.headline1!.copyWith(color: TGreen),
                  textAlign: TextAlign.center,
                  textScaleFactor: textScale,

                ),
                SizedBox(height:  40/ 1600* size.height,),
                Form(
                  key: _OTPFormKey,
                    child:
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 16.0),
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
                        Opacity(
                          opacity: 0.5,
                            child: Text("Resend Code",style: Theme.of(context).textTheme.headline4)),
                        SizedBox(height: 75.0/1600* size.height,),
                        CButton(formKey: _OTPFormKey,
                            height: 75.0/1600* size.height,
                            width: 310.0/757* size.width,
                            press:() {
                            if (_OTPFormKey.currentState!.validate()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                builder: (context) => ResetPass(),
                              ),
                              );
                            }
                            },
                            name: "Confirm")
                      ],),
                )
              ],
            ),
          ),
        )
        ,
      )
      ,
    );
  }
}

class COTPInput extends StatelessWidget {
  const COTPInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        height: 107/1600* size.height,
      width: 107/757* size.width,

        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade400,
              ),
              BoxShadow(
                  color: TBgWhite,
                  spreadRadius: 5.0,
                  blurRadius: 10.0,
                  offset: Offset(10,7)
              ),
            ], gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment(0, 0),
          colors: [
            Colors.white,
            Colors.white.withOpacity(0.2),
          ],
        ),

            borderRadius: BorderRadius.circular(50.0)
        ),
      child: Center(
        child: TextFormField(

          onChanged: (value){
            if(value.length == 1){
              FocusScope.of(context).nextFocus();
            }
          },
          decoration: InputDecoration(
            errorStyle: TextStyle(
                height: 0,
                fontSize: 0,
                decoration: null
            ),
            errorMaxLines: 1,
            border: InputBorder.none,
          ),
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly
          ],
        ),
      )
    );
  }
}
