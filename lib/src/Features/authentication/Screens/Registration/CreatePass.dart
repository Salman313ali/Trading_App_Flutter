import 'package:flutter/material.dart';
import 'package:trading_app/src/Features/Home/Home.dart';
import 'package:trading_app/src/Features/authentication/Screens/Wigets/Button.dart';
import 'package:trading_app/src/Features/authentication/Screens/Wigets/Text_feild.dart';

import '../../../../Constants/Color.dart';
import '../on_boarding_screen.dart';
import 'OTP.dart';


class CreatePass extends StatelessWidget {
   CreatePass({Key? key}) : super(key: key);

  final _ResetFormKey = GlobalKey<FormState>();
  final _newPassController = TextEditingController();
  final _confirmPassController = TextEditingController();
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
            padding: EdgeInsets.symmetric(horizontal:44.0/mockupWidth* size.width , vertical: 34.0/mockupHeight* size.height),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                        "NEW PASSWORD",
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
                SizedBox(height: 50.0/mockupHeight* size.height,),
                Text(
                  "Create New Password",
                  style: Theme.of(context).textTheme.headline1!.copyWith(color: TGreen),
                  textAlign: TextAlign.center,
                  textScaleFactor: textScale,
                ),
                SizedBox(height:20.0),
                Form(
                  key: _ResetFormKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start  ,
                      children: [
                        Text(
                          "Enter New Pin",
                          style: Theme.of(context).textTheme.headline2,
                          textScaleFactor: textScale,
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 30.0,left: 80/757* size.width,right: 80/757* size.width,top: 30),
                          child: Row(

                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              COTPInput(),
                              SizedBox(width: 25/757* size.width,),
                              COTPInput(),
                              SizedBox(width: 25/757* size.width,),
                              COTPInput(),
                              SizedBox(width: 25/757* size.width,),
                              COTPInput(),
                            ],
                          ),
                        ),
                        SizedBox(height:20.0),
                        Text(
                          "Re-Enter New Pin",
                          style: Theme.of(context).textTheme.headline2,
                          textScaleFactor: textScale,
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 30.0,left: 80/757* size.width,right: 80/757* size.width,top: 30.0),
                          child: Row(

                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              COTPInput(),
                              SizedBox(width: 25/757* size.width,),
                              COTPInput(),
                              SizedBox(width: 25/757* size.width,),
                              COTPInput(),
                              SizedBox(width: 25/757* size.width,),
                              COTPInput(),
                            ],
                          ),
                        ),
                        SizedBox(height: 25.0,),
                        CButton(
                          formKey: _ResetFormKey,
                          width: 310.0/mockupWidth* size.width,
                          press: (){
                          if(_ResetFormKey.currentState!.validate()){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Home(),
                              ),
                            );
                          }
                        }, name: "Continue",
                          height: 75.0/mockupHeight* size.height,)
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
