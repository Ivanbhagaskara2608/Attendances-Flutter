import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/subject.dart';
import 'package:flutter_application_1/pages/detail_subject.dart';

class SubjectCard extends StatelessWidget {
  final Subject currentSubject;

  SubjectCard(
    this.currentSubject
  );

  @override
  Widget build(BuildContext context) {
    Color containerColor = currentSubject.type == "created"
        ? Color.fromARGB(255, 44, 62, 80)
        : Colors.grey.shade800;

    return Container(
      height: 117,
      margin: EdgeInsets.only(right: 30, left: 30, bottom: 30),
      child: Material(
        borderRadius: BorderRadius.circular(15),
        color: containerColor,
        child: InkWell(
          splashColor: Colors.grey,
          borderRadius: BorderRadius.circular(15),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailSubjectPage(currentSubject)));
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      currentSubject.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    PopupMenuButton(
                        icon: Icon(
                          Icons.more_horiz,
                          color: Colors.white,
                        ),
                        itemBuilder: (context) {
                          return <PopupMenuEntry>[
                            PopupMenuItem(
                                child: ListTile(
                              leading: Icon(
                                Icons.exit_to_app,
                                color: Color.fromARGB(255, 199, 0, 57),
                              ),
                              title: Text("Leave Subject"),
                              onTap: () {
                                print("leave");
                              },
                            ))
                          ];
                        }),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      currentSubject.createdBy,
                      style: TextStyle(fontSize: 13, color: Colors.white),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        Text(
                          currentSubject.totalMembers.toString(),
                          style: TextStyle(fontSize: 13, color: Colors.white),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
