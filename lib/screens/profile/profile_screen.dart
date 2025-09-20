import 'package:ecoconnect/models/student.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample student data
    Student student = Student(
      name: 'John Doe',
      enrollmentNumber: '1234567890',
      branch: 'Computer Science',
      year: 2023,
      image: 'https://example.com/profile.jpg', // Replace with an actual image URL
      otherDetails: 'Active member of the EcoClub',
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 75,
                backgroundImage: NetworkImage(student.image),
              ),
            ),
            const SizedBox(height: 20),
            Text('Name: ${student.name}', style: const TextStyle(fontSize: 18)),
            Text('Enrollment Number: ${student.enrollmentNumber}', style: const TextStyle(fontSize: 18)),
            Text('Branch: ${student.branch}', style: const TextStyle(fontSize: 18)),
            Text('Year: ${student.year}', style: const TextStyle(fontSize: 18)),
            Text('Other Details: ${student.otherDetails}', style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
