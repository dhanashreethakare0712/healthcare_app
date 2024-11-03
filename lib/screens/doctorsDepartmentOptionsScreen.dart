import 'package:flutter/material.dart';
import 'package:hello_world/screens/homeScreen.dart';

import 'departmentWiseDoctorsScreen.dart';

class DoctorsDepartmentOptionsScreen extends StatefulWidget {
  const DoctorsDepartmentOptionsScreen({super.key});

  @override
  State<DoctorsDepartmentOptionsScreen> createState() => _DoctorsDepartmentOptionsScreenState();
}

class _DoctorsDepartmentOptionsScreenState extends State<DoctorsDepartmentOptionsScreen> {
  bool _isSearching = false;
  TextEditingController _searchController = TextEditingController();

  final List<Map<String, dynamic>> specialities = [
    {"name": "Cardiology", "icon": Icons.favorite},
    {"name": "Dermatology", "icon": Icons.face},
    {"name": "Endocrinology", "icon": Icons.wb_sunny},
    {"name": "Gastroenterology", "icon": Icons.local_dining},
    {"name": "Hematology", "icon": Icons.opacity},
    {"name": "Neurology", "icon": Icons.spa},
    {"name": "Oncology", "icon": Icons.healing},
    {"name": "Ophthalmology", "icon": Icons.remove_red_eye},
    {"name": "Orthopedics", "icon": Icons.accessibility},
    {"name": "Otolaryngology", "icon": Icons.hearing},
    {"name": "Pediatrics", "icon": Icons.child_care},
    {"name": "Psychiatry", "icon": Icons.sentiment_satisfied},
   // {"name": "Pulmonology", "icon": Icons.lungs},
    {"name": "Rheumatology", "icon": Icons.sports_handball},
    {"name": "Urology", "icon": Icons.wc},
  ];

  List<Map<String, dynamic>> filteredSpecialities = [];

  @override
  void initState() {
    super.initState();
    filteredSpecialities = specialities;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Theme.of(context).iconTheme.color),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
        ),
        title: _isSearching
            ? Container(
              width: 400, // Set width
              height: 50,
              child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                isDense: true,
                filled: true,
                fillColor: Colors.white,
                hintText: 'Search...',
               // border: InputBorder.none,
                border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide(color: Colors.grey),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              hintStyle: TextStyle(),
              ),
              style: const TextStyle( fontSize: 20),
              onChanged: (value) {
              setState(() {
                filteredSpecialities = specialities
                    .where((speciality) => speciality['name'].toLowerCase().contains(value.toLowerCase()))
                    .toList();
              });
                        },
                      ),
            )
            : const Text(
          'Doctor Specialities',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        actions: [
          IconButton(
            color: Colors.white,
            icon: _isSearching ? Icon(Icons.close) : Icon(Icons.search),
            onPressed: () {
              setState(() {
                _isSearching = !_isSearching;
                if (!_isSearching) {
                  _searchController.clear();
                  filteredSpecialities = specialities;
                }
              });
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Container(
          //   height: 50,
          //   padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
          //   child: const Text(
          //     'Doctor Specialities',
          //     style: TextStyle(
          //       fontSize: 20,
          //       // fontWeight: FontWeight.bold,
          //     ),
          //   ),
          // ),
          SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              itemCount: filteredSpecialities.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 4,
                  child: ListTile(
                    tileColor: Colors.white,
                    leading: Icon(filteredSpecialities[index]['icon']),
                    title: Text(filteredSpecialities[index]['name']),
                    trailing: GestureDetector(
                      child: Icon(Icons.arrow_forward_ios_outlined),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DepartmentWiseDoctorsScreen(
                              specialty: filteredSpecialities[index]['name'],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}