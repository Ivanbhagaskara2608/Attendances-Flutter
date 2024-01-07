import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/attendance.dart';
import 'package:flutter_application_1/pages/attendance_detail_page.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';

class AttendanceCard extends StatelessWidget {
  final Attendance attendance;

  AttendanceCard(this.attendance);

  Future<Position> getCurrentLocation() async {
    Location location = Location();
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // return Future.error("Location service are disables!");
      location.requestPermission();
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Location permission are denied!");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          "Location permission are denied forever, we cannot request permission");
    }

    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    Color statusBackgroundColor = (() {
      switch (attendance.status) {
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
      switch (attendance.status) {
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
          onTap: () {
            // getCurrentLocation().then((value) {
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => AttendanceDetailPage(attendance, value.latitude, value.longitude)));
            // });
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AttendanceDetailPage(attendance)));
          },
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
                    attendance.title,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 44, 62, 80)),
                  ),
                  Text(
                    attendance.createdAt,
                    style: TextStyle(fontSize: 12),
                  )
                ],
              ),
              Spacer(),
              CircleAvatar(
                backgroundColor: statusBackgroundColor,
                maxRadius: 18,
                child: Text(
                  attendance.status.toUpperCase(),
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
