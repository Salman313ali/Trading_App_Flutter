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
    return Scaffold(
      appBar: AppBar(
        title: Text("Enter Code",style: Theme.of(context).textTheme.headline3!.copyWith(color: TGreen),),
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
            padding: EdgeInsets.symmetric(vertical: 16.0,horizontal: 10.0),
            child: Column(
              children: [
                Text("Enter the OTP received on your mobile number",style: Theme.of(context).textTheme.headline3,textAlign: TextAlign.center,),
                SizedBox(height: 16.0,),
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
                        SizedBox(height: 16.0,),
                        CButton(formKey: _OTPFormKey,
                            width: MediaQuery.of(context).size.width*0.3,
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
                      ],

                    ),
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
    return SizedBox(
      height: 68.0,
      width: 64.0,
      child: TextFormField(

        onChanged: (value){
          if(value.length == 1){
            FocusScope.of(context).nextFocus();
          }
        },
        decoration: InputDecoration(

          hintText: "0",
          filled: true,
          fillColor: Colors.grey[900],
          border: OutlineInputBorder(

            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: TGreen),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: TGreen),
            borderRadius: BorderRadius.circular(10),
          ),

        ),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
      )
    );
  }
}
