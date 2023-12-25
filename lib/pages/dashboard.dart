import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/subject.dart';
import 'package:flutter_application_1/pages/scan_attendance.dart';
import 'package:flutter_application_1/widgets/app_bar.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
import 'package:flutter_application_1/widgets/subject_card.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: ListView.builder(
        itemCount: subjects.length,
        itemBuilder: (context, index) {
          Subject currentSubject = subjects[index];

          return SubjectCard(currentSubject);
        },
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Scan Attendance',
        onPressed: () {
          Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AttendanceScanner()));
        },
        backgroundColor: const Color.fromARGB(255, 44, 62, 80),
        child: const Icon(
          Icons.camera_alt,
          color: Colors.white,
        ),
      ),
    );
  }
}
