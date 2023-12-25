import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/attendance.dart';
import 'package:flutter_application_1/model/subject.dart';
import 'package:flutter_application_1/widgets/attendance_card.dart';

class SubjectDashboard extends StatelessWidget {
  final Subject currentSubject;

  SubjectDashboard(this.currentSubject);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15, right: 15, left: 15),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 117,
            margin: EdgeInsets.only(bottom: 25),
            child: Material(
              borderRadius: BorderRadius.circular(15),
              color: Color.fromARGB(255, 44, 62, 80),
              child: InkWell(
                onTap: () {},
                splashColor: Colors.grey,
                borderRadius: BorderRadius.circular(15),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        currentSubject.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        currentSubject.description,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: attendances.length,
              itemBuilder: (context, index) {
                Attendance attendance = attendances[index];

                return AttendanceCard(
                  attendance.title,
                  attendance.createdAt,
                  attendance.status,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
