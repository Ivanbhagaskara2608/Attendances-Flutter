import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/attendance.dart';
import 'package:flutter_application_1/pages/scan_attendance.dart';
import 'package:flutter_application_1/widgets/small_dropdown.dart';
import 'package:flutter_application_1/widgets/small_textfield_custom.dart';
import 'package:flutter_application_1/widgets/textfield_custom.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class AttendanceDetailMemberView extends StatelessWidget {
  final Attendance attendance;
  final LatLng userLatLng;
  final bool isLocationLoading;
  final Function() onRefreshLocation;
  final Color statusBackgroundColor;
  final Color statusTextColor;
  final Marker positionMarker;
  final Completer<GoogleMapController> mapController;
  final CameraPosition mapInitialPosition;

  AttendanceDetailMemberView({
    required this.attendance,
    required this.userLatLng,
    required this.isLocationLoading,
    required this.onRefreshLocation,
    required this.statusBackgroundColor,
    required this.statusTextColor,
    required this.positionMarker,
    required this.mapController,
    required this.mapInitialPosition,
  });

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
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
                attendance.title,
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
                  attendance.status.toUpperCase(),
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
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ElevatedButton(
              onPressed: () {
                onRefreshLocation();
              },
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
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return DialogAttend();
                  },
                );
              },
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
    );
  }
}

// ignore: must_be_immutable
class DialogAttend extends StatelessWidget {
  final List<String> statusItems = [
    'Leave',
    'Sick',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 35),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Image.asset("assets/icon_warning.png", width: 80, height: 80),
          SizedBox(
            height: 10,
          ),
          Text(
            "Are you sure?",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 175, 134, 1)),
          ),
          Text('Your status will change not "present"'),
          SizedBox(
            height: 20,
          ),
          SmallDropDown(items: statusItems, selectedValue: selectedValue),
          SizedBox(
            height: 15,
          ),
          SmallCustomTextFIeld("Reason"),
          Container(
            margin: EdgeInsets.only(top: 15),
            width: double.infinity,
            height: 70,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                    color: Color.fromARGB(255, 44, 62, 80), width: 1)),
            child: Center(
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add,
                    size: 30,
                  )),
            ),
          ),
          SizedBox(
            height: 28,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                  child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 199, 0, 57),
                    minimumSize: Size.fromHeight(35),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                child: Text(
                  "Yes, I'm sure!",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.white),
                ),
              )),
              SizedBox(
                width: 20,
              ),
              Expanded(
                  child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 44, 62, 80),
                    minimumSize: Size.fromHeight(35),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                child: Text(
                  "Cancel",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.white),
                ),
              ))
            ],
          ),
        ]),
      ),
    );
  }
}
