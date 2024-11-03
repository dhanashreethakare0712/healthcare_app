// import 'package:flutter/material.dart';
// import 'package:hello_world/global_variable.dart';
// import 'package:hello_world/screens/profileScreen.dart';
// import 'loginScreen.dart';
//
// class AccountOptionsScreen extends StatelessWidget {
//   const AccountOptionsScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           iconTheme: const IconThemeData(color: Colors.white),
//           title: Text('My Account', style: TextStyle(fontSize: 20, color: Colors.white),),
//       ),
//       body: ListView(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(5.0),
//             child: Card(
//               elevation: 4,
//               child: Container(
//                 height: 150, // Set the desired height here
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(20), // Adjust the border radius to make the container rounded
//                   // boxShadow: [
//                   //   BoxShadow(
//                   //     color: Colors.grey.withOpacity(0.5),
//                   //     spreadRadius: 3,
//                   //     blurRadius: 7,
//                   //     offset: Offset(0, 3), // changes position of shadow
//                   //   ),
//                   // ],
//                 ),
//                 child: Center(
//                   child: ListTile(
//                    // tileColor: Colors.white,
//                   //  leading: Icon(Icons.account_circle_outlined), // Profile icon
//                     title: Text('Profile', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
//                     subtitle: Text('View and edit your profile'),
//                     trailing: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Icon(
//                           Icons.account_circle_outlined,
//                           size: 50,
//                           color: GlobalVariable.appBarColor, // Set the icon color to blue
//                         ),
//                         SizedBox(width: 10), // Add spacing between the icons
//                         IconButton(
//                           icon: Icon(
//                             Icons.arrow_forward_ios_outlined,
//                            // size: 20,
//                             color: GlobalVariable.appBarColor, // Set the icon color to red
//                           ),
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(builder: (context) => ProfileScreen()),
//                             );
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Card(
//             //color: Colors.white,
//             elevation: 4,
//             child: ListTile(
//               tileColor: Colors.white,
//               leading: Icon(Icons.medical_services_outlined), // Leading icon
//               title: buildOptionItem(context, 'Medication Reminders'),
//               trailing: Icon(Icons.arrow_forward_ios_outlined),
//             ),
//           ),
//           Card(
//             elevation: 4,
//             child: ListTile(
//               tileColor: Colors.white,
//               leading: Icon(Icons.description_outlined), // Leading icon
//               title: buildOptionItem(context, 'Medical Records'),
//               trailing: Icon(Icons.arrow_forward_ios_outlined),
//             ),
//           ),
//           Card(
//             elevation: 4,
//             child: ListTile(
//               tileColor: Colors.white,
//               leading: Icon(Icons.payment_outlined), // Leading icon
//               title: buildOptionItem(context, 'Billing and Payments'),
//               trailing: Icon(Icons.arrow_forward_ios_outlined),
//             ),
//           ),
//           Card(
//             elevation: 4,
//             child: ListTile(
//               tileColor: Colors.white,
//               leading: Icon(Icons.favorite_outline), // Leading icon
//               title: buildOptionItem(context, 'Health and Support'),
//               trailing: Icon(Icons.arrow_forward_ios_outlined),
//             ),
//           ),
//           Card(
//             elevation: 4,
//             child: ListTile(
//               tileColor: Colors.white,
//               leading: Icon(Icons.feedback_outlined), // Leading icon
//               title: buildOptionItem(context, 'Feedback'),
//               trailing: Icon(Icons.arrow_forward_ios_outlined),
//             ),
//           ),
//           Card(
//             elevation: 4,
//             child: ListTile(
//               tileColor: Colors.white,
//               leading: Icon(Icons.contacts_outlined), // Leading icon
//               title: buildOptionItem(context, 'Emergency Contacts'),
//               trailing: Icon(Icons.arrow_forward_ios_outlined),
//             ),
//           ),
//           Card(
//             elevation: 4,
//             child: ListTile(
//               tileColor: Colors.white,
//               leading: Icon(Icons.logout), // Leading icon
//               title: buildOptionItem(context, 'Logout'),
//               trailing: Icon(Icons.arrow_forward_ios_outlined),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget buildOptionItem(BuildContext context, String option) {
//     return ListTile(
//       title: Text(option),
//       onTap: () {
//         if (option == 'Logout') {
//           // Perform logout action
//           // For example, navigate back to the login screen
//           Navigator.pushAndRemoveUntil(
//             context,
//             MaterialPageRoute(builder: (context) => LoginScreen()),
//                 (route) => false,
//           );
//         } else {
//           // Handle other options
//         }
//       },
//     );
//   }
// }
