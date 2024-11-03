import 'package:flutter/material.dart';
import '../global_variable.dart';
import 'bookAppointment.dart';
import 'doctorsDepartmentOptionsScreen.dart';

class DepartmentWiseDoctorsScreen extends StatefulWidget {
  String? specialty;
  DepartmentWiseDoctorsScreen({super.key, required this.specialty});

  @override
  State<DepartmentWiseDoctorsScreen> createState() => _DepartmentWiseDoctorsScreenState();
}

class _DepartmentWiseDoctorsScreenState extends State<DepartmentWiseDoctorsScreen> {
  bool _isSearching = false;
  TextEditingController _searchController = TextEditingController();

  final Doctor doctor = Doctor(
    name: 'Dr. John Doe',
    imageUrl: 'assets/doctor1.jpg',
    description: 'Experienced cardiologist with over 10 years of practice.',
    specialty: 'Cardiology',
    location: '123 Main St, City',
    contact: '+123 456 7890',
    schedule: [
      {'day': 'Monday', 'date': '22/04'},
      {'day': 'Wednesday', 'date': '24/04'},
      {'day': 'Friday', 'date': '26/04'},
    ],
    availableTimes: ['10:00 AM', '2:00 PM', '4:00 PM'],
  );


  final List<Map<String, dynamic>> doctors = [
  {"name" : 'Dr. Smith'},
  {"name" : 'Dr. Johnson'},
  {"name" : 'Dr. Williams'},
  {"name" : 'Dr. Brown'},
  ];

  List<Map<String, dynamic>> filteredSpecialities = [];

  @override
  void initState() {
    super.initState();
    filteredSpecialities = doctors;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
              color: Theme.of(context).iconTheme.color
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
                  filteredSpecialities = doctors
                      .where((speciality) => speciality['name'].toLowerCase().contains(value.toLowerCase()))
                      .toList();
                });
              },
            ),
          )
              : const Text(
            'Search',
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
                    filteredSpecialities = doctors;
                  }
                });
              },
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: filteredSpecialities.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 4,
              child: ListTile(
                tileColor: Colors.white,
                leading: Container(
                  width: 100, // Adjust width as needed
                  height: 100, // Adjust height as needed
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/welcomeImage.jpg'),
                      fit: BoxFit.contain, // Use BoxFit.cover to maintain aspect ratio
                    ),
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 16), // Adjust vertical padding
                visualDensity: VisualDensity(vertical: 2), // Adjust vertical density
                title: Text((filteredSpecialities[index]['name'])),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Specialty: ${widget.specialty}'),
                    Text('MBBS, MD'),
                  ],
                ),
                trailing: ElevatedButton(
                  // style: ElevatedButton.styleFrom(
                  //  // padding: EdgeInsets.symmetric(horizontal: 32), // Adjust padding as needed
                  //   minimumSize: Size(120, 40),
                  //   backgroundColor: GlobalVariable.appBarColor, // Midnight blue color
                  // ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
                      return GlobalVariable.appBarColor ; // Highlight the button if selected
                    }),
                    elevation: MaterialStateProperty.all(0),
                    minimumSize: MaterialStateProperty.resolveWith<Size>((states) {
                      return Size(120, 40); // Highlight the button if selected
                    }),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BookAppointmentScreen(doctor: doctor,)),
                    );
                  },
                  child: const Text('Book', style: TextStyle(
                      fontSize: 18, color: Colors.white)),
                ),// Add subtitle
                // You can add more details or actions for each doctor
              ),
            );
          },
        )

    );
  }
}
class Doctor {
  final String name;
  final String imageUrl;
  final String description;
  final String specialty;
  final String location;
  final String contact;
  final List<Map<String, String>> schedule;
  final List<String> availableTimes;

  Doctor({
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.specialty,
    required this.location,
    required this.contact,
    required this.schedule,
    required this.availableTimes,
  });
}