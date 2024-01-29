import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/subject.dart';
import 'package:flutter_application_1/pages/succes_create_attendance_page.dart';
import 'package:flutter_application_1/widgets/small_textfield_custom.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:toggle_switch/toggle_switch.dart';

class CreateAttendancePage extends StatefulWidget {
  final Subject currentSubject;
  const CreateAttendancePage(this.currentSubject, {super.key});

  @override
  State<CreateAttendancePage> createState() => _CreateAttendancePageState();
}

class _CreateAttendancePageState extends State<CreateAttendancePage> {
  final titleController = TextEditingController();
  final dateController = TextEditingController();
  final startTimeController = TextEditingController();
  final endTimeController = TextEditingController();
  TimeOfDay selectedTime = TimeOfDay.now();
  bool isLocationActive = true;
  int initialLabelIndex = 1;
  late LatLng userLatLng = LatLng(0, 0);
  late bool isLocationLoading = true;

  Future<void> getCurrentLocation() async {
    Location location = Location();
    PermissionStatus permissionGranted;

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
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

    setState(() {
      isLocationLoading = true;
    });

    Position position = await Geolocator.getCurrentPosition();

    setState(() {
      userLatLng = LatLng(position.latitude, position.longitude);
      isLocationLoading = false;
    });
  }

  @override
  void initState() {
    getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
          "Create Attendance",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 44, 62, 80)),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: const Color.fromARGB(255, 44, 62, 80)),
        elevation: 1,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Title :",
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 44, 62, 80)),
          ),
          TextField(
            controller: titleController,
            cursorColor: Color.fromARGB(255, 44, 62, 80),
            decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 44, 62, 80)))),
          ),
          SizedBox(
            height: 15,
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
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(
                    2000), //DateTime.now() - not to allow to choose before today.
                lastDate: DateTime(2101),
                builder: (context, child) {
                  return Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: ColorScheme.light(
                          primary: Color.fromARGB(255, 44, 62, 80)),
                    ),
                    child: child!,
                  );
                },
              );

              if (pickedDate != null) {
                print(
                    pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                String formattedDate =
                    DateFormat('d MMMM yyyy').format(pickedDate);
                print(
                    formattedDate); //formatted date output using intl package =>  2021-03-16
                //you can implement different kind of Date Format here according to your requirement

                setState(() {
                  dateController.text =
                      formattedDate; //set output date to TextField value.
                });
              } else {
                print("Date is not selected");
              }
            },
            cursorColor: Color.fromARGB(255, 44, 62, 80),
            decoration: InputDecoration(
                suffixIcon: Icon(Icons.calendar_month_rounded),
                suffixIconColor: Color.fromARGB(255, 44, 62, 80),
                focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 44, 62, 80)))),
          ),
          SizedBox(
            height: 15,
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
                    onTap: () async {
                      final TimeOfDay? startTime = await showTimePicker(
                          context: context,
                          initialTime: selectedTime,
                          initialEntryMode: TimePickerEntryMode.dial,
                          builder: (context, child) {
                            return Theme(
                              data: Theme.of(context).copyWith(
                                colorScheme: ColorScheme.light(
                                    primary: Color.fromARGB(255, 44, 62, 80)),
                              ),
                              child: child!,
                            );
                          });
                      if (startTime != null) {
                        setState(() {
                          startTimeController.text =
                              "${startTime.hour}:${startTime.minute}";
                        });
                      }
                    },
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
                    onTap: () async {
                      final TimeOfDay? endTime = await showTimePicker(
                          context: context,
                          initialTime: selectedTime,
                          initialEntryMode: TimePickerEntryMode.dial,
                          builder: (context, child) {
                            return Theme(
                              data: Theme.of(context).copyWith(
                                colorScheme: ColorScheme.light(
                                    primary: Color.fromARGB(255, 44, 62, 80)),
                              ),
                              child: child!,
                            );
                          });
                      if (endTime != null) {
                        setState(() {
                          endTimeController.text =
                              "${endTime.hour}:${endTime.minute}";
                        });
                      }
                    },
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
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Text(
                "Location: ",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Color.fromARGB(255, 44, 62, 80)),
              ),
              Spacer(),
              ToggleSwitch(
                minWidth: 40,
                minHeight: 20,
                fontSize: 10,
                cornerRadius: 30,
                activeBgColors: [
                  [Color.fromARGB(255, 190, 0, 57)],
                  [Color.fromARGB(255, 15, 175, 1)]
                ],
                activeFgColor: Colors.white,
                inactiveBgColor: Colors.white,
                inactiveFgColor: Colors.white,
                borderColor: [Colors.grey],
                borderWidth: 1,
                initialLabelIndex: initialLabelIndex,
                totalSwitches: 2,
                labels: ['OFF', 'ON'],
                radiusStyle: true,
                onToggle: (index) {
                  setState(() {
                    initialLabelIndex = index!;
                    if (initialLabelIndex == 0) {
                      isLocationActive = false;
                    } else {
                      isLocationActive = true;
                    }
                  });
                },
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Visibility(
              visible: isLocationActive,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 130,
                    child: (isLocationLoading)
                        ? Center(
                            child: CircularProgressIndicator(
                              color: Color.fromARGB(255, 44, 62, 80),
                              backgroundColor: Colors.grey,
                            ),
                          )
                        : (userLatLng.latitude != 0 &&
                                userLatLng.longitude != 0)
                            ? GoogleMap(
                                zoomGesturesEnabled: true,
                                mapType: MapType.normal,
                                markers: {positionMarker},
                                circles: {
                                  Circle(
                                      circleId: CircleId("1"),
                                      center: userLatLng,
                                      radius: 150,
                                      strokeWidth: 2,
                                      strokeColor:
                                          Color.fromARGB(255, 190, 0, 57),
                                      fillColor:
                                          Color.fromARGB(255, 255, 177, 199)
                                              .withOpacity(0.6))
                                },
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
                ],
              )),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SuccesCreateAttendancePage(
                            titleController.text,
                            dateController.text,
                            startTimeController.text,
                            endTimeController.text,
                            (!isLocationActive) ? LatLng(0, 0) : userLatLng,
                            widget.currentSubject)));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 44, 62, 80),
                  minimumSize: Size.fromHeight(35),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0))),
              child: Text(
                "Create",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
