import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/attendance.dart';
import 'package:flutter_application_1/pages/scan_attendance.dart';
import 'package:flutter_application_1/widgets/textfield_custom.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class AttendanceDetailPage extends StatefulWidget {
  final Attendance attendance;
  final double latitude;
  final double longitude;
  AttendanceDetailPage(this.attendance, this.latitude, this.longitude, {super.key});

  @override
  State<AttendanceDetailPage> createState() => _AttendanceDetailPageState();
}

class _AttendanceDetailPageState extends State<AttendanceDetailPage> {
  late LatLng userLatLng = LatLng(widget.latitude, widget.longitude);
  // Get current location
  Future<Position> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error("Location service are disables!");
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
      switch (widget.attendance.status) {
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
      switch (widget.attendance.status) {
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

    Completer<GoogleMapController> mapController = Completer();

    CameraPosition mapInitialPosition =
        CameraPosition(target: userLatLng, zoom: 15.0);

    final Marker positionMarker = Marker(
        markerId: MarkerId("_positionMarker"),
        infoWindow: InfoWindow(title: "You are here"),
        icon: BitmapDescriptor.defaultMarker,
        position: userLatLng);

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Attendance Detail",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 44, 62, 80)),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          iconTheme:
              IconThemeData(color: const Color.fromARGB(255, 44, 62, 80)),
          elevation: 1,
        ),
        body: SlidingUpPanel(
          maxHeight: 270,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.0),
            topRight: Radius.circular(24.0),
          ),
          panel: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: Icon(
                  Icons.keyboard_arrow_down,
                  color: Color.fromARGB(255, 44, 62, 80),
                )),
                Text(
                  "Attendance Code: ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Color.fromARGB(255, 44, 62, 80)),
                ),
                SizedBox(
                  height: 5,
                ),
                CustomTextFIeld("Attendance Code"),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 44, 62, 80),
                        minimumSize: Size.fromHeight(35),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                    child: Text(
                      "Submit",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AttendanceScanner()));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 175, 134, 1),
                        minimumSize: Size.fromHeight(35),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                    child: Text(
                      "Scan Attendance Code",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            child: Center(
                child: ListView(children: [
              Column(
                children: [
                  Text(
                    widget.attendance.title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Color.fromARGB(255, 44, 62, 80)),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: statusBackgroundColor,
                    child: Text(
                      widget.attendance.status.toUpperCase(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: statusTextColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Created by: ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Color.fromARGB(255, 44, 62, 80)),
                      ),
                      Text(
                        widget.attendance.createdBy,
                        style: TextStyle(fontSize: 14),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    child: Divider(
                      height: 15,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Date: ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Color.fromARGB(255, 44, 62, 80)),
                  ),
                  Text(
                    widget.attendance.createdAt,
                    style: TextStyle(fontSize: 14),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    child: Divider(
                      height: 15,
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Start Time: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Color.fromARGB(255, 44, 62, 80)),
                          ),
                          Text(
                            widget.attendance.startTime,
                            style: TextStyle(fontSize: 14),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            color: Colors.black,
                            child: Divider(
                              height: 15,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 40),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "End Time: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Color.fromARGB(255, 44, 62, 80)),
                          ),
                          Text(
                            widget.attendance.endTime,
                            style: TextStyle(fontSize: 14),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Divider(
                              height: 15,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Location: ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Color.fromARGB(255, 44, 62, 80)),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: GoogleMap(
                  zoomGesturesEnabled: true,
                  mapType: MapType.normal,
                  markers: {positionMarker},
                  initialCameraPosition: mapInitialPosition,
                  onMapCreated: (GoogleMapController controller) {
                    mapController.complete(controller);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 44, 62, 80),
                      minimumSize: Size.fromHeight(35),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                  child: Text(
                    "Refresh Location",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 190, 0, 57),
                      minimumSize: Size.fromHeight(35),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                  child: Text(
                    "Unable to Attend",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white),
                  ),
                ),
              ),
            ])),
          ),
        ));
  }
}
