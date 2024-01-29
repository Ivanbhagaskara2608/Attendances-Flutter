import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/subject.dart';
import 'package:flutter_application_1/pages/create_attendance_page.dart';
import 'package:flutter_application_1/pages/subject_dashboard.dart';
import 'package:flutter_application_1/pages/subject_member_page.dart';
import 'package:flutter_application_1/pages/subject_settings.dart';
import 'package:flutter_application_1/widgets/app_bar.dart';

class DetailSubjectPage extends StatefulWidget {
  final Subject currentSubject;

  DetailSubjectPage(this.currentSubject);

  @override
  State<DetailSubjectPage> createState() => _DetailSubjectPageState();
}

class _DetailSubjectPageState extends State<DetailSubjectPage> {
  int _currentIndex = 0;
  late List<Widget> tabs = [
    SubjectDashboard(widget.currentSubject),
    CreateAttendancePage(widget.currentSubject),
    SubjectMemberPage(widget.currentSubject),
    SubjectSettingsPage(widget.currentSubject),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        body: tabs[_currentIndex],
        bottomNavigationBar: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black38, spreadRadius: 0, blurRadius: 10),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
              child: BottomNavigationBar(
                currentIndex: _currentIndex,
                unselectedItemColor: Colors.grey[800],
                selectedItemColor: Color.fromARGB(255, 44, 62, 80),
                showSelectedLabels: false,
                showUnselectedLabels: false,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.speed,
                        size: 40,
                      ),
                      label: "Dashboard"),
                  if (widget.currentSubject.type == "created")
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.add,
                        color: Color.fromARGB(255, 15, 175, 1),
                        size: 40,
                      ),
                      label: "Add",
                    ),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.groups,
                        size: 40,
                      ),
                      label: "Member"),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.settings,
                        size: 40,
                      ),
                      label: "Settings")
                ],
                onTap: (index) {
                  setState(() {
                    if (index == 1) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreateAttendancePage(widget.currentSubject)));
                    } else {
                      _currentIndex = index;
                    }
                  });
                },
              ),
            )));
  }
}
