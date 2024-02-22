import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/attendance.dart';
import 'package:flutter_application_1/pages/statistic_attendance_page.dart';
import 'package:flutter_application_1/widgets/small_textfield_custom.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:toggle_switch/toggle_switch.dart';

class AttendanceDetailAdminView extends StatefulWidget {
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
  State<AttendanceDetailAdminView> createState() =>
      _AttendanceDetailAdminViewState();
}

class _AttendanceDetailAdminViewState extends State<AttendanceDetailAdminView> {
  final dateController = TextEditingController();
  final startTimeController = TextEditingController();
  final endTimeController = TextEditingController();
  final locationController = TextEditingController();
  TimeOfDay selectedTime = TimeOfDay.now();
  bool isLocationActive = true;
  int initialLabelIndex = 1;

  @override
  void initState() {
    dateController.text = widget.attendance.createdAt;
    startTimeController.text = widget.attendance.startTime;
    endTimeController.text = widget.attendance.endTime;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        children: [
          Center(
            child: Text(
              widget.attendance.title,
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
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 44, 62, 80)))),
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
                                        primary:
                                            Color.fromARGB(255, 44, 62, 80)),
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
                                        primary:
                                            Color.fromARGB(255, 44, 62, 80)),
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
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 130,
                    child: (widget.isLocationLoading)
                        ? Center(
                            child: CircularProgressIndicator(
                              color: Color.fromARGB(255, 44, 62, 80),
                              backgroundColor: Colors.grey,
                            ),
                          )
                        : (widget.userLatLng.latitude != 0 &&
                                widget.userLatLng.longitude != 0)
                            ? GoogleMap(
                                zoomGesturesEnabled: true,
                                mapType: MapType.normal,
                                markers: {widget.positionMarker},
                                circles: {
                                  Circle(
                                      circleId: CircleId("1"),
                                      center: widget.userLatLng,
                                      radius: 150,
                                      strokeWidth: 2,
                                      strokeColor:
                                          Color.fromARGB(255, 190, 0, 57),
                                      fillColor:
                                          Color.fromARGB(255, 255, 177, 199)
                                              .withOpacity(0.6))
                                },
                                initialCameraPosition:
                                    widget.mapInitialPosition,
                                onMapCreated: (GoogleMapController controller) {
                                  if (!widget.mapController.isCompleted) {
                                    widget.mapController.complete(controller);
                                  }
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
                  SmallCustomTextFIeld(hintName: "Location",
                      isRequired: true,
                      isEmail: false,
                      minLength: 0,
                      maxLength: null,
                      controller: locationController),
                ],
              )),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return DialogUpdate();
                    });
              },
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
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            StatisticAttendancePage(widget.attendance)));
              },
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
        ]);
  }
}

class DialogUpdate extends StatelessWidget {
  const DialogUpdate({super.key});

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
          Text("You will update this attendance"),
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
                    backgroundColor: Color.fromARGB(255, 44, 62, 80),
                    minimumSize: Size.fromHeight(35),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                child: Text(
                  "Submit",
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
                    backgroundColor: Color.fromARGB(255, 199, 0, 57),
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
