
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/screens/accountOptionsScreen.dart';

class HealthAndSupportScreen extends StatefulWidget {
  const HealthAndSupportScreen({super.key});

  @override
  HealthAndSupportScreenState createState() => HealthAndSupportScreenState();
}

class HealthAndSupportScreenState extends State<HealthAndSupportScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 10,
      ),
      body: Stack(
        children: [
          Container(
           // width: double.infinity,
           // height: 200, // Adjust the height as needed
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/healthAndSupport.jpeg'), // Your image path
                fit: BoxFit.fill, // Adjust the fit as needed
              ),
            ),
          ),
          Positioned(
            top: 0, // Adjust the top position of the text
            left: 20, // Adjust the left position of the text
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Theme.of(context).iconTheme.color),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    //  MaterialPageRoute(builder: (_) => WelcomeScreen()),
                    MaterialPageRoute(builder: (_) => const AccountOptionsScreen()),
                  );
                }
            ),
          ),
        ],
      )
    );
  }
}
