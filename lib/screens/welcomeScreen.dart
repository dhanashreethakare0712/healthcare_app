import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/global_variable.dart';
import 'package:hello_world/screens/registrationScreen.dart';

import 'loginScreen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Full-screen background image
          Image.asset(
            'assets/welcomeImage.jpg',
            fit: BoxFit.cover,
          ),
          // Button positioned at the top of the image
          Positioned(
            bottom: 110,
            left: 70,
            right: 70,
            child: SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  RegistrationScreen()),
                  );
                },
                child: Text('Create Account', style: TextStyle(color: GlobalVariable.appBarColor, fontWeight: FontWeight.bold, fontSize: 18)),
              ),
            ),
          ),
          // Button positioned at the bottom of the image
          Positioned(
            bottom: 50,
            left: 70,
            right: 70,
            child: SizedBox(
             // width: 200, // Adjust width as needed
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                  );
                },
                child: Text('Login',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: GlobalVariable.appBarColor)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
