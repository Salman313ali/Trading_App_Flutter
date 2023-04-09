import 'package:flutter/material.dart';
import 'package:trading_app/src/Constants/Color.dart';
import 'Registration/registration.dart';
import 'Wigets/Mslider.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 55.0),
                child: Image(
                  image: AssetImage("Assets/Images/Logo/logo.png"),
                  width: 110.0,
                ),
              ),
              MSlider(
                mainPath: "Assets/Images/onboardimages/",
                picsPath: ["pic1.png", "pic2.png", "pic3.png"],
                cont: [
                  "Mobile banking like never before",
                  "Invite your friends & earn money",
                  "Get your Debit card or Go virtual with our MasterCard"
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: FilledButton(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          "CREATE AN ACCOUNT",
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(color: TWhite),
                        ),
                      ),
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
                    ),
                  ),
                  SizedBox(height: 0.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      "Already have an account",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: FilledButton(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          "LOGIN",
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(color: TGreen),
                        ),
                      ),
                      onPressed: () {},
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all<double>(2.0),
                        backgroundColor:
                        MaterialStateProperty.all<Color>(TBgWhite),
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