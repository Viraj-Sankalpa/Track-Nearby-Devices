import 'package:blu/registation.dart';
import 'package:flutter/material.dart';

import 'components/rounded_button.dart';
import 'login.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // child: Image.asset(
        //   "assets/images/bg1.jpg",
        //   fit: BoxFit.cover,
        // ),
        // padding: EdgeInsets.symmetric(horizontal: 24),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 40.0,
            ),
            RoundedButton(
              title: "Log in",
              colour: Colors.red,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            ),
            SizedBox(
              height: 40.0,
            ),
            RoundedButton(
              title: "Register",
              colour: Colors.red,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RegistationScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
