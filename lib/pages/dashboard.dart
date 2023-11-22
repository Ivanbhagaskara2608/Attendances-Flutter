import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/subject.dart';
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
        itemCount: createdSubjects.length,
        itemBuilder: (context, index) {
          Subject currentSubject = createdSubjects[index];

          return SubjectCard(currentSubject.title, currentSubject.createdBy, currentSubject.totalMembers);
        },
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        onPressed: () {},
        backgroundColor: const Color.fromARGB(255, 44, 62, 80),
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}
