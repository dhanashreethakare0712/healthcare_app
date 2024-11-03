import 'dart:async';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:hello_world/screens/doctorsDepartmentOptionsScreen.dart';
import '../global_variable.dart';
import 'accountOptionsScreen.dart';
import 'loginScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _currentIndex = 0;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
  }

  DateTime selectedDate = DateTime.now();

  void showInSnackBar(String value) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Hello, Alice ', style:  TextStyle(color: Colors.white),),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white, size: 30,), // Notification icon
            onPressed: () {
              // Add your notification icon onPressed logic here
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                CarouselSlider(
                  items: [
                    'assets/1.jpeg',
                    'assets/2.jpeg',
                    'assets/3.jpeg',
                  ].map((item) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                          ),
                          child: Image.asset(
                            item,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    );
                  }).toList(),
                  options: CarouselOptions(
                    autoPlay: true,
                    height: 180,
                    viewportFraction: 1,
                    onPageChanged: (index, _) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                ),
                Positioned(
                  bottom: 10.0,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < 3; i++)
                        Container(
                          width: 10.0,
                          height: 10.0,
                          margin: EdgeInsets.symmetric(horizontal: 2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentIndex == i ? Colors.blueAccent : Colors.grey,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Online Consultation Container
                      Container(
                        width: 180,
                        height: 180,
                        decoration: BoxDecoration(
                          color: Color(0xFFADD8E6).withOpacity(0.4),
                          // color: Colors.blue.withOpacity(0.1),
                          border: Border.all(
                            color: Color(0xFFADD8E6),
                            width: 2, // Set the border width here
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                              child: Column(
                                children: [
                                  Container(
                                    child: Text(
                                      'Online\nConsultation',
                                      style: TextStyle(
                                        color: GlobalVariable.appBarColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                children: [
                                  Container(
                                    child: Text(
                                      'Care And Cure Is Our Goal',
                                      style: TextStyle(
                                        color: GlobalVariable.appBarColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            Center(
                              child: TextButton(
                                onPressed: () {
                                  // Add your logic here
                                },
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0), // Adjust the value to control the roundness
                                    ),
                                  ),
                                  backgroundColor: MaterialStateProperty.all<Color>(Colors.white), // Set background color to white
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Text(
                                    'Find Doctor',
                                    style: TextStyle(
                                      color: GlobalVariable.appBarColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Offline Visit Container
                      Container(
                        width: 180,
                        height: 180,
                        decoration: BoxDecoration(
                          color: Color(0xFFFFB6C1).withOpacity(0.4),
                          // color: Colors.blue.withOpacity(0.1),
                          border: Border.all(
                            color: Color(0xFFFFB6C1),
                            width: 2, // Set the border width here
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                              child: Text(
                                'Visit a Doctor\nOffline',
                                style: TextStyle(
                                  color: GlobalVariable.appBarColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Health Care',
                                style: TextStyle(
                                  color: GlobalVariable.appBarColor,
                                ),
                              ),
                            ),
                            Center(
                              child: TextButton(
                                onPressed: () {
                                  // Add your logic here
                                },
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0), // Adjust the value to control the roundness
                                    ),
                                  ),
                                  backgroundColor: MaterialStateProperty.all<Color>(Colors.white), // Set background color to white
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Text(
                                    'Appointment',
                                    style: TextStyle(
                                      color: GlobalVariable.appBarColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: const Text('Upcoming Appointment', style:  TextStyle(fontSize: 20),),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          color: Color(0xFFD3D3D3).withOpacity(0.4),
                          // color: Colors.blue.withOpacity(0.1),
                          border: Border.all(
                            color: Color(0xFFD3D3D3),
                            width: 2, // Set the border width here
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Center(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30), // Adjust the value to control the roundness
                                  child: Image.asset(
                                    'assets/welcomeImage.jpg',
                                    width: 100,
                                    height: 80,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Online Consultation',
                                    style: TextStyle(
                                      color: GlobalVariable.appBarColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Icon(Icons.access_time, color: GlobalVariable.appBarColor, size: 16),
                                      SizedBox(width: 5),
                                      Text(
                                        '10:00 AM',
                                        style: TextStyle(color: GlobalVariable.appBarColor),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.calendar_today, color: GlobalVariable.appBarColor, size: 16),
                                      SizedBox(width: 5),
                                      Text(
                                        'April 25, 2024',
                                        style: TextStyle(color: GlobalVariable.appBarColor,),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _isExpanded = !_isExpanded;
                        });
                      },
                      child: SingleChildScrollView(
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          height: _isExpanded ? null : null, // Height will be null when expanded to fit the content
                          decoration: BoxDecoration(
                            //color: Color(0xFFADD8E6),
                            color: Colors.blue.withOpacity(0.1),
                            border: Border.all(
                              color: Colors.blue, // Set the border color here
                              width: 2, // Set the border width here
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(
                                      'Article',
                                      style: TextStyle(
                                        color: GlobalVariable.appBarColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: Text(
                                      'By Dr. Emily Johnson, Cardiologist',
                                      style: TextStyle(
                                        color: GlobalVariable.appBarColor,
                                        fontStyle: FontStyle.italic,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    child: Text(
                                      _isExpanded
                                          ? 'Understanding Cardiac Health:\nA Guide for Patients As a practicing cardiologist, I am often asked about maintaining heart health. Your heart is the engine of your body, and taking care of it is crucial for a long and healthy life. Here are some essential tips.\nHealthy Eating: A balanced diet rich in fruits, vegetables, whole grains, and lean proteins can help lower your risk of heart disease.\nRegular Exercise: Aim for at least 30 minutes of moderate-intensity exercise most days of the week. This could be as simple as brisk walking, swimming, or cycling.\nQuit Smoking: Smoking damages your heart and blood vessels. If you smoke, quitting is one of the best things you can do for your heart.\nManage Stress: Chronic stress can take a toll on your heart. Find healthy ways to manage stress, such as meditation, yoga, or spending time with loved ones.\nRegular Check-ups: See your doctor regularly for check-ups and screenings to monitor your heart health.'
                                          : 'Understanding Cardiac Health \nAs a practicing cardiologist, I am often asked about maintaining heart health.',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  if (!_isExpanded)
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _isExpanded = true;
                                            });
                                          },
                                          child: Text(
                                            'Read more',
                                            style: TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        //color: GlobalVariable.titlecolor,
        child: Container(
          color: Colors.transparent,
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildNavItem(Icons.home_outlined, 'Home', 0),
              buildNavItem(Icons.favorite_outline, 'Care', 1),
              buildNavItem(Icons.medical_services_outlined, 'My Doctor', 2),
              buildNavItem(Icons.tips_and_updates_outlined, 'Wellness', 3),
              buildNavItem(Icons.person_2_outlined, 'Account', 4),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNavItem(IconData icon, String label, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
        switch (index) {
          case 0:
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(builder: (context) => HomeScreen()),
          //   );
            break;
          case 1:
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(builder: (context) => CareScreen()),
          //   );
            break;
          case 2:
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const DoctorsDepartmentOptionsScreen()),
            );
            break;
          case 3:
          // Navigate to the Wellness screen
          // Replace WellnessScreen() with the actual screen you want to navigate to
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(builder: (context) => DoctorsDepartmentOptionsScreen()),
          //   );
            break;
          case 4:
          // Navigate to the Account screen
          // Replace AccountScreen() with the actual screen you want to navigate to
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AccountOptionsScreen()),
            );
            break;
          default:
            break;
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: _selectedIndex == index ? GlobalVariable.appBarColor : Colors
                .grey.shade500,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: _selectedIndex == index
                  ? GlobalVariable.appBarColor
                  : Colors.grey.shade500,
            ),
          ),
        ],
      ),
    );
  }
}