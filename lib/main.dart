import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hello_world/global_variable.dart';
import 'package:hello_world/model/registration.dart';
import 'package:hello_world/screens/homeScreen.dart';
import 'package:hello_world/screens/loginScreen.dart';
import 'package:hello_world/screens/welcomeScreen.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(RegistrationAdapter());
  //var boxRegistration = await Hive.openBox<Registration>('registrationbox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     // title: 'Flutter Demo',
        theme: ThemeData(
        appBarTheme: AppBarTheme(
        color: GlobalVariable.appBarColor,
        ),
          iconTheme: const IconThemeData(color: Colors.white),
       ),
      home: const Scaffold(
        body: SplashScreen(),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      // Navigate to the second screen after the splash screen duration
      Navigator.of(context).pushReplacement(
      //  MaterialPageRoute(builder: (_) => WelcomeScreen()),
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        //padding: EdgeInsets.fromLTRB(0, 270, 0, 0),
        child:  Container(
          height: 400,
          child: Image.asset('assets/splash.jpeg',
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}

