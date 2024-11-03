// import 'package:flutter/material.dart';
//
// class SearchScreen extends StatefulWidget {
//   @override
//   _SearchScreenState createState() => _SearchScreenState();
// }
//
// class _SearchScreenState extends State<SearchScreen> {
//   bool _isSearching = false;
//   TextEditingController _searchController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: _isSearching
//             ? TextField(
//           controller: _searchController,
//           decoration: InputDecoration(
//             hintText: 'Search...',
//             border: InputBorder.none,
//             hintStyle: TextStyle(color: Colors.white),
//           ),
//           style: TextStyle(color: Colors.white),
//           onChanged: (value) {
//             // Perform search operation based on value
//           },
//         )
//             : Text('Search Screen'),
//         actions: [
//           IconButton(
//             icon: _isSearching ? Icon(Icons.close) : Icon(Icons.search),
//             onPressed: () {
//               setState(() {
//                 _isSearching = !_isSearching;
//                 if (!_isSearching) {
//                   _searchController.clear();
//                 }
//               });
//             },
//           ),
//         ],
//       ),
//       body: Center(
//         child: Text('Search Content'),
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }
// }
