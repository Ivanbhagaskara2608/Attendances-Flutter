import 'package:flutter/material.dart';

class AttendanceCard extends StatelessWidget {
  final String title;
  final String createdAt;
  final String status;

  AttendanceCard(this.title, this.createdAt, this.status);

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
          return Color.fromARGB(
              255, 122, 173, 223); // atau warna default lainnya
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
          return Color.fromARGB(255, 44, 62, 80); // atau warna default lainnya
      }
    })();

    return Container(
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      child: Material(
        borderRadius: BorderRadius.circular(15),
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.grey,
          onTap: () {},
          borderRadius: BorderRadius.circular(15),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 22, horizontal: 12),
            child: Row(children: [
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: CircleAvatar(
                  maxRadius: 20,
                  backgroundColor: Color.fromARGB(255, 44, 62, 80),
                  child: Icon(
                    Icons.my_library_books_outlined,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 44, 62, 80)),
                  ),
                  Text(
                    createdAt,
                    style: TextStyle(fontSize: 12),
                  )
                ],
              ),
              Spacer(),
              CircleAvatar(
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
            ]),
          ),
        ),
      ),
    );
  }
}
