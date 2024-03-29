import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/database/db_helper.dart';
import 'package:flutter_application_1/model/api_response.dart';
import 'package:flutter_application_1/model/subject.dart';
import 'package:flutter_application_1/model/user.dart';
import 'package:flutter_application_1/pages/scan_attendance.dart';
import 'package:flutter_application_1/services/base_client.dart';
import 'package:flutter_application_1/shared_preferences_helper.dart';
import 'package:flutter_application_1/widgets/app_bar.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
import 'package:flutter_application_1/widgets/subject_card.dart';

class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    super.initState();
    _getUserProfile();
  }

  Future<void> _getUserProfile() async {
    final token = await SharedPreferencesHelper.getToken();
    if (token != null) {
      var response =
          await BaseClient().get("user/profile", token).catchError((err) {});

      ApiResponse<User> apiResponse = ApiResponse.fromJson(
        json.decode(response.body),
        (data) => User.fromJson(data),
      );

      if (response.statusCode == 200 && apiResponse.success == true) {
        await DBHelper.updateUser(apiResponse.data);
        print(apiResponse.data.type);
      } else {
        print(apiResponse.message);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: RefreshIndicator(
        color: Color.fromARGB(255, 44, 62, 80),
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 2));
          _getUserProfile();
        },
        child: ListView.builder(
          itemCount: subjects.length,
          itemBuilder: (context, index) {
            Subject currentSubject = subjects[index];

            return SubjectCard(currentSubject);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Scan Attendance',
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AttendanceScanner()));
        },
        backgroundColor: const Color.fromARGB(255, 44, 62, 80),
        child: const Icon(
          Icons.camera_alt,
          color: Colors.white,
        ),
      ),
    );
  }
}
