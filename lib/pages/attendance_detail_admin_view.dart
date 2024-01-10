import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/attendance.dart';
import 'package:flutter_application_1/widgets/small_textfield_custom.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AttendanceDetailAdminView extends StatelessWidget {
  final Attendance attendance;
  final LatLng userLatLng;
  final bool isLocationLoading;
  final Function() onRefreshLocation;
  final Marker positionMarker;
  final Completer<GoogleMapController> mapController;
  final CameraPosition mapInitialPosition;

  AttendanceDetailAdminView({
    required this.attendance,
    required this.userLatLng,
    required this.isLocationLoading,
    required this.onRefreshLocation,
    required this.positionMarker,
    required this.mapController,
    required this.mapInitialPosition,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
      child: Center(
          child: ListView(children: [
        Center(
          child: Text(
            attendance.title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Color.fromARGB(255, 44, 62, 80)),
          ),
        ),
        SizedBox(
          height: 12,
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
                  attendance.createdBy,
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
              attendance.createdAt,
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
                      attendance.startTime,
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
                      attendance.endTime,
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
          child: (isLocationLoading)
              ? Center(
                  child: CircularProgressIndicator(
                    color: Color.fromARGB(255, 44, 62, 80),
                    backgroundColor: Colors.grey,
                  ),
                )
              : (userLatLng.latitude != 0 && userLatLng.longitude != 0)
                  ? GoogleMap(
                      zoomGesturesEnabled: true,
                      mapType: MapType.normal,
                      markers: {positionMarker},
                      initialCameraPosition: mapInitialPosition,
                      onMapCreated: (GoogleMapController controller) {
                        mapController.complete(controller);
                      },
                    )
                  : Center(
                      child: Text(
                        'Turn On your location',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ),
        ),
        SizedBox(
          height: 10,
        ),
        SmallCustomTextFIeld("Location"),
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
              "Update",
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
                backgroundColor: Color.fromARGB(255, 175, 134, 1),
                minimumSize: Size.fromHeight(35),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0))),
            child: Text(
              "Statistic Attendance",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.white),
            ),
          ),
        ),
      ])),
    );
  }
}
