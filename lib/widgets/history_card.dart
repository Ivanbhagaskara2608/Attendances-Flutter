import 'package:flutter/material.dart';

class HistoryCard extends StatelessWidget {
  final String subject;
  final String attendance;
  final String status;
  final String date;
  final String time;

  HistoryCard(this.subject, this.attendance, this.status, this.date, this.time);

  @override
  Widget build(BuildContext context) {
    Color statusBackgroundColor = (() {
      switch (status) {
        case "P":
          return Color.fromARGB(255, 158, 255, 150);
        case "L":
          return Color.fromARGB(255, 225, 220, 108);
        case "S":
          return Color.fromARGB(255, 204, 204, 204);
        case "A":
          return Color.fromARGB(255, 255, 177, 199);
        default:
          return Colors.transparent; // atau warna default lainnya
      }
    })();

    Color statusTextColor = (() {
      switch (status) {
        case "P":
          return Color.fromARGB(255, 15, 175, 1);
        case "L":
          return Color.fromARGB(255, 175, 134, 1);
        case "S":
          return Color.fromARGB(255, 66, 66, 66);
        case "A":
          return Color.fromARGB(255, 190, 0, 57);
        default:
          return Colors.transparent; // atau warna default lainnya
      }
    })();

    return Container(
      margin: EdgeInsets.only(right: 21, left: 21, top: 25),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: CircleAvatar(
                  backgroundColor: statusBackgroundColor,
                  maxRadius: 18,
                  child: Text(
                    status.toUpperCase(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: statusTextColor,
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subject,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 2),
                  Text(
                    attendance,
                    style: TextStyle(fontSize: 10),
                  )
                ],
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    date,
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 2),
                  Text(
                    time,
                    style: TextStyle(fontSize: 8),
                  )
                ],
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Divider(
              height: 15,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
