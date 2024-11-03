// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:hello_world/screens/doctorsDepartmentOptionsScreen.dart';
// import '../global_variable.dart';
// import 'accountOptionsScreen.dart';
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
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//       ),
//       body: const Center(),
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
//               buildNavItem(Icons.medical_services_outlined, 'My Doctor', 2),
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
//         switch (index) {
//           case 0:
//           //   Navigator.push(
//           //     context,
//           //     MaterialPageRoute(builder: (context) => HomeScreen()),
//           //   );
//             break;
//           case 1:
//           //   Navigator.push(
//           //     context,
//           //     MaterialPageRoute(builder: (context) => CareScreen()),
//           //   );
//             break;
//           case 2:
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: (context) => const DoctorsDepartmentOptionsScreen()),
//             );
//             break;
//           case 3:
//           // Navigate to the Wellness screen
//           // Replace WellnessScreen() with the actual screen you want to navigate to
//           //   Navigator.push(
//           //     context,
//           //     MaterialPageRoute(builder: (context) => DoctorsDepartmentOptionsScreen()),
//           //   );
//             break;
//           case 4:
//           // Navigate to the Account screen
//           // Replace AccountScreen() with the actual screen you want to navigate to
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => AccountOptionsScreen()),
//             );
//             break;
//           default:
//             break;
//         }
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
// }