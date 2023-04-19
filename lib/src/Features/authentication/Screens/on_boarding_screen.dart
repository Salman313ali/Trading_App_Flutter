import 'package:flutter/material.dart';
import 'package:pixel_perfect/pixel_perfect.dart';
import 'package:trading_app/src/Constants/Color.dart';
import 'package:trading_app/src/Features/authentication/Screens/login.dart';
import 'Registration/registration.dart';
import 'Wigets/Mslider.dart';

const mockupHeight = 1600;
const mockupWidth = 757;

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scale = mockupWidth/size.width;
    final textScale = size.width/mockupWidth;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              //logo of company
              Padding(
                padding: EdgeInsets.only(top: 100.0/mockupHeight* size.height),
                child: Image(
                  image: AssetImage("Assets/Images/Logo/logo.png"),
                  height: 120.0/mockupHeight* size.height,
                ),
              ),

              //Slider
              const MSlider(
                mainPath: "Assets/Images/onboardimages/",
                picsPath: ["pic1.png", "pic2.png", "pic3.png"],
                cont: [
                  "Mobile banking like never before",
                  "Invite your friends & earn money",
                  "Get your Debit card or Go virtual with our MasterCard"
                ],
              ),

              //Buttons
              Column(
                children: [
                  SizedBox(
                    height: 50/1600* size.height,
                  ),

                  //create account button
                  SizedBox(
                    width: 475/757*size.width,
                    child: FilledButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegistrationForm(),
                          ),
                        );
                      },
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all<double>(2.0),
                        backgroundColor:
                        MaterialStateProperty.all<Color>(TGreen),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          "CREATE AN ACCOUNT",
                          style: Theme.of(context)
                              .textTheme
                              .headline2!
                              .copyWith(color: TWhite,fontWeight: FontWeight.bold),
                          textScaleFactor: size.width/757,
                        ),
                      ),
                    ),
                  ),

                  //text
                  Padding(
                    padding:  EdgeInsets.symmetric(vertical: 20/1600*size.height),
                    child: Text(
                      "Already have an account",
                      style: Theme.of(context).textTheme.headline3!.copyWith(fontWeight: FontWeight.bold),
                      textScaleFactor: size.width/757,
                    ),
                  ),


                  //Login Button
                  SizedBox(
                    width: 475/757*size.width,
                    child: FilledButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        );
                      },
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all<double>(2.0),
                        backgroundColor:
                        MaterialStateProperty.all<Color>(TBgWhite),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          "LOGIN",
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(color: TGreen,fontWeight: FontWeight.bold),
                          textScaleFactor:  size.width/757,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}