import 'package:flutter/material.dart';

class SubjectCard extends StatelessWidget {
  final String title;
  final String createdBy;
  final int totalMembers;

  SubjectCard(this.title, this.createdBy, this.totalMembers);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 117,
      margin: EdgeInsets.only(right: 30, left: 30, top: 30),
      child: Material(
        borderRadius: BorderRadius.circular(15),
        color: const Color.fromARGB(255, 44, 62, 80),
        child: InkWell(
          splashColor: Colors.grey,
          borderRadius: BorderRadius.circular(15),
          onTap: () {
            print("Container was tapped");
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
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    Icon(
                      Icons.more_horiz,
                      color: Colors.white,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      createdBy,
                      style: TextStyle(fontSize: 13, color: Colors.white),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        Text(
                          totalMembers.toString(),
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
