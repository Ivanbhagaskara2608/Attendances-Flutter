import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/model/subject.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:randomstring_dart/randomstring_dart.dart';
import 'package:share_files_and_screenshot_widgets/share_files_and_screenshot_widgets.dart';

class SuccesCreateAttendancePage extends StatelessWidget {
  final String title;
  final String date;
  final String startTime;
  final String endTime;
  final LatLng userLatLng;
  final Subject currentSubject;

  SuccesCreateAttendancePage(this.title, this.date, this.startTime,
      this.endTime, this.userLatLng, this.currentSubject);

  @override
  Widget build(BuildContext context) {
    final codeController = TextEditingController();
    final dateController = TextEditingController();
    final startTimeController = TextEditingController();
    final endTimeController = TextEditingController();
    GlobalKey previewContainer = GlobalKey();
    final rs = RandomString();
    String code = rs.getRandomString(
      uppersCount: 10,
      lowersCount: 10,
      numbersCount: 10,
      specialsCount: 2,
    );
    String caption =
        "📢${currentSubject.title}📢\n✨$title✨\n🔑Code: $code\n🗓️Date: $date\n🕒Start Time: $startTime\n🕒End Time: $endTime\nDon't forget to check in❗️❗️";

    codeController.text = code;
    dateController.text = date;
    startTimeController.text = startTime;
    endTimeController.text = endTime;

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
          "Success",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 44, 62, 80)),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: const Color.fromARGB(255, 44, 62, 80)),
        elevation: 1,
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 20),
              child: IconButton(
                  onPressed: () {
                    ShareFilesAndScreenshotWidgets().shareScreenshot(
                        previewContainer,
                        800,
                        "qr-presensi",
                        "$title.jpeg",
                        "image/jpeg",
                        text: caption);
                  },
                  icon: Icon(
                    Icons.share,
                    color: Color.fromARGB(255, 15, 175, 1),
                  )))
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        children: [
          RepaintBoundary(
            key: previewContainer,
            child: Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Color.fromARGB(255, 44, 62, 80)),
                  ),
                  Text(
                    currentSubject.title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: Color.fromARGB(255, 44, 62, 80)),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: QrImageView(
                      data: code,
                      version: 3,
                    ),
                  )
                ],
              ),
            ),
          ),
          Text(
            "Attendance Code :",
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 44, 62, 80)),
          ),
          TextField(
            controller: codeController,
            readOnly: true,
            cursorColor: Color.fromARGB(255, 44, 62, 80),
            decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () async {
                    await Clipboard.setData(
                        ClipboardData(text: codeController.text));
                    // copied successfully
                  },
                  icon: Icon(
                    Icons.copy,
                    color: Colors.grey,
                    size: 18,
                  ),
                ),
                suffixIconColor: Color.fromARGB(255, 44, 62, 80),
                focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 44, 62, 80)))),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Date :",
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 44, 62, 80)),
          ),
          TextField(
            controller: dateController,
            readOnly: true,
            cursorColor: Color.fromARGB(255, 44, 62, 80),
            decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 44, 62, 80)))),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Start Time :",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 44, 62, 80)),
                  ),
                  TextField(
                    controller: startTimeController,
                    readOnly: true,
                    cursorColor: Color.fromARGB(255, 44, 62, 80),
                    decoration: InputDecoration(
                        suffixIcon: Icon(Icons.access_time),
                        suffixIconColor: Color.fromARGB(255, 44, 62, 80),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 44, 62, 80)))),
                  ),
                ],
              )),
              Spacer(),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "End Time :",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 44, 62, 80)),
                  ),
                  TextField(
                    controller: endTimeController,
                    readOnly: true,
                    cursorColor: Color.fromARGB(255, 44, 62, 80),
                    decoration: InputDecoration(
                        suffixIcon: Icon(Icons.access_time),
                        suffixIconColor: Color.fromARGB(255, 44, 62, 80),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 44, 62, 80)))),
                  ),
                ],
              )),
            ],
          ),
          (userLatLng.latitude != 0 && userLatLng.longitude != 0)
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Location: ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Color.fromARGB(255, 44, 62, 80)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 130,
                      child: GoogleMap(
                        zoomGesturesEnabled: true,
                        mapType: MapType.normal,
                        markers: {positionMarker},
                        circles: {
                          Circle(
                              circleId: CircleId("1"),
                              center: userLatLng,
                              radius: 150,
                              strokeWidth: 2,
                              strokeColor: Color.fromARGB(255, 190, 0, 57),
                              fillColor: Color.fromARGB(255, 255, 177, 199)
                                  .withOpacity(0.6))
                        },
                        initialCameraPosition: mapInitialPosition,
                        onMapCreated: (GoogleMapController controller) {
                          mapController.complete(controller);
                        },
                      ),
                    )
                  ],
                )
              : SizedBox()
        ],
      ),
    );
  }
}
