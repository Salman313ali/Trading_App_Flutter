import 'package:flutter/material.dart';
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false; // block back button
      },
      child: Scaffold(

        body: Center(
          child: Text("Welcome to Home Screen"),
        ),
      ),
    );
  }
}
