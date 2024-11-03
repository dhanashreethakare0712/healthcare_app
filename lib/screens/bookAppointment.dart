import 'package:flutter/material.dart';

import 'departmentWiseDoctorsScreen.dart';

class BookAppointmentScreen extends StatelessWidget {
  final Doctor doctor;

  BookAppointmentScreen({required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(doctor.name),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(doctor.imageUrl), // Assuming images are in the assets folder
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Description:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(doctor.description),
                SizedBox(height: 20),
                Text(
                  'Specialty:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(doctor.specialty),
                SizedBox(height: 20),
                Text(
                  'Location:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(doctor.location),
                SizedBox(height: 20),
                Text(
                  'Contact:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(doctor.contact),
                SizedBox(height: 20),
                Text(
                  'Schedule:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Container(
                  height: 60,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: doctor.schedule.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(right: 10),
                        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              doctor.schedule[index]['day']!,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              doctor.schedule[index]['date']!,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Available Times:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: doctor.availableTimes
                      .map((time) => Text(time))
                      .toList(),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Handle booking appointment logic here
                  },
                  child: Text('Book Appointment'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

