// // import 'dart:async';
// // import 'package:flutter/material.dart';
// // import '../global_variable.dart';
// // import 'accountOptionsScreen.dart';
// // import 'loginScreen.dart';
// //
// // class HomeScreen extends StatefulWidget {
// //   const HomeScreen({Key? key}) : super(key: key);
// //
// //   @override
// //   HomeScreenState createState() => HomeScreenState();
// // }
// //
// // class HomeScreenState extends State<HomeScreen> {
// //   int _selectedIndex = 0;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //   }
// //
// //   DateTime selectedDate = DateTime.now();
// //
// //   void showInSnackBar(String value) {
// //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value)));
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         automaticallyImplyLeading: false,
// //       ),
// //       body: Center(),
// //
// //       bottomNavigationBar: BottomAppBar(
// //         // color: Colors.white,
// //         child: Container(
// //           color: Colors.white,
// //           height: 60,
// //           child: Row(
// //             mainAxisAlignment: MainAxisAlignment.spaceAround,
// //             children: [
// //               buildNavItem(Icons.home_outlined, 'Home', 0),
// //               buildNavItem(Icons.favorite_outline, 'Care', 1),
// //               buildNavItem(Icons.medical_services_outlined, 'Doctor', 2),
// //               buildNavItem(Icons.tips_and_updates_outlined, 'Wellness', 3),
// //               buildNavItem(Icons.account_circle_outlined, 'Account', 4),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// //
// //   Widget buildNavItem(IconData icon, String label, int index) {
// //     return InkWell(
// //       onTap: () {
// //         setState(() {
// //           _selectedIndex = index;
// //         });
// //         // Navigate to the corresponding screen
// //         if (index == 4) {
// //           Navigator.push(
// //             context,
// //             MaterialPageRoute(builder: (context) => AccountOptionsScreen()),
// //           );
// //         }
// //       },
// //       child: Column(
// //         mainAxisAlignment: MainAxisAlignment.center,
// //         children: [
// //           Icon(
// //             icon,
// //             color: _selectedIndex == index ? GlobalVariable.appBarColor : Colors.grey.shade500,
// //           ),
// //           const SizedBox(height: 4),
// //           Text(
// //             label,
// //             style: TextStyle(
// //               color: _selectedIndex == index ? GlobalVariable.appBarColor : Colors.grey.shade500,
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// //
// import 'dart:async';
// import 'package:flutter/material.dart';
// import '../global_variable.dart';
// import 'accountOptionsScreen.dart';
// import 'doctorsDepartmentOptionsScreen.dart';
// import 'loginScreen.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   HomeScreenState createState() => HomeScreenState();
// }
//
// class HomeScreenState extends State<HomeScreen> {
//   int _selectedIndex = 0;
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   DateTime selectedDate = DateTime.now();
//
//   void showInSnackBar(String value) {
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value)));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   automaticallyImplyLeading: false,
//       // ),
//       // body: _selectedIndex == 4 ? AccountOptionsScreen() : Center(),
//       //body: _buildBody(),
//       body: Center(),
//
//       bottomNavigationBar: BottomAppBar(
//         color: Colors.white,
//         child: Container(
//           color: Colors.transparent,
//           height: 60,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               buildNavItem(Icons.home_outlined, 'Home', 0),
//               buildNavItem(Icons.favorite_outline, 'Care', 1),
//               buildNavItem(Icons.medical_services_outlined, 'Doctor', 2),
//               buildNavItem(Icons.tips_and_updates_outlined, 'Wellness', 3),
//               buildNavItem(Icons.account_circle_outlined, 'Account', 4),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget buildNavItem(IconData icon, String label, int index) {
//     return InkWell(
//       onTap: () {
//         setState(() {
//           _selectedIndex = index;
//         });
//       },
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(
//             icon,
//             color: _selectedIndex == index ? GlobalVariable.appBarColor : Colors
//                 .grey.shade500,
//           ),
//           const SizedBox(height: 4),
//           Text(
//             label,
//             style: TextStyle(
//               color: _selectedIndex == index
//                   ? GlobalVariable.appBarColor
//                   : Colors.grey.shade500,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildBody() {
//     switch (_selectedIndex) {
//       case 0:
//         return _buildHomeScreen();
//       case 1:
//         return _buildCareScreen();
//       case 2:
//         return const doctorsDepartmentOptionsScreen();
//       case 3:
//         return _buildWellnessScreen();
//       case 4:
//         return const AccountOptionsScreen();
//       default:
//         return Container();
//     }
//   }
//
//   Widget _buildHomeScreen() {
//     return const Center(
//       child: Text('Home Screen'),
//     );
//   }
//
//   Widget _buildCareScreen() {
//     return const Center(
//       child: Text('Care Screen'),
//     );
//   }
//
//   Widget _buildDoctorScreen() {
//     return const Center(
//       child: Text('Doctor Screen'),
//     );
//   }
//
//   Widget _buildWellnessScreen() {
//     return const Center(
//       child: Text('Wellness Screen'),
//     );
//   }
// }