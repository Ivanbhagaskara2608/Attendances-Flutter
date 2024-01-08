import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/attendance.dart';
import 'package:flutter_application_1/model/subject.dart';
import 'package:flutter_application_1/pages/attendance_detail_admin_view.dart';
import 'package:flutter_application_1/pages/attendance_detail_member_view.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:rotating_icon_button/rotating_icon_button.dart';

class AttendanceDetailPage extends StatefulWidget {
  final Attendance attendance;
  final Subject currentSubject;
  AttendanceDetailPage(this.attendance, this.currentSubject, {super.key});

  @override
  State<AttendanceDetailPage> createState() => _AttendanceDetailPageState();
}

class _AttendanceDetailPageState extends State<AttendanceDetailPage> {
  late LatLng userLatLng = LatLng(0, 0);
  late bool isLocationLoading = true;
  late String viewText = (widget.currentSubject.type == "created")
      ? "Moderator\nView"
      : "Member\nView";
  // Get current location
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
          actions: [
            if (widget.currentSubject.type == "created")
              RotatingIconButton(
                  onTap: () {
                    setState(() {
                      if (viewText == "Moderator\nView") {
                        viewText = "Member\nView";
                      } else {
                        viewText = "Moderator\nView";
                      }
                    });
                  },
                  rotateType: RotateType.full,
                  child: Column(
                    children: [
                      Icon(
                        Icons.loop,
                        color: Color.fromARGB(255, 15, 175, 1),
                      ),
                      Text(
                        viewText,
                        style: TextStyle(
                            fontSize: 5,
                            color: Color.fromARGB(255, 15, 175, 1)),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ))
          ],
        ),
        body: (viewText == "Moderator\nView")
            ? AttendanceDetailAdminView(
                attendance: widget.attendance,
                userLatLng: userLatLng,
                isLocationLoading: isLocationLoading,
                onRefreshLocation: () {
                  getCurrentLocation();
                },
                positionMarker: positionMarker,
                mapController: mapController,
                mapInitialPosition: mapInitialPosition)
            : AttendanceDetailMemberView(
                attendance: widget.attendance,
                userLatLng: userLatLng,
                isLocationLoading: isLocationLoading,
                onRefreshLocation: () {
                  getCurrentLocation();
                },
                statusBackgroundColor: statusBackgroundColor,
                statusTextColor: statusTextColor,
                positionMarker: positionMarker,
                mapController: mapController,
                mapInitialPosition: mapInitialPosition,
              ));
  }
}
