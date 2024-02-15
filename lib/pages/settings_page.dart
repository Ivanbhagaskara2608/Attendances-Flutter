import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/database/db_helper.dart';
import 'package:flutter_application_1/model/api_response.dart';
import 'package:flutter_application_1/model/user.dart';
import 'package:flutter_application_1/pages/about_us_page.dart';
import 'package:flutter_application_1/pages/edit_profile_page.dart';
import 'package:flutter_application_1/pages/login.dart';
import 'package:flutter_application_1/pages/subscription_histories_page.dart';
import 'package:flutter_application_1/services/base_client.dart';
import 'package:flutter_application_1/shared_preferences_helper.dart';
import 'package:flutter_application_1/widgets/app_bar.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
import 'package:flutter_application_1/widgets/small_password_textfield.dart';
import 'package:flutter_application_1/widgets/small_textfield_custom.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  User? userData;
  void getData() async {
    final user = await DBHelper.getUser();
    setState(() {
      userData = user;
    });
  }

  String? formatDate(String? inputDate) {
  if (inputDate != null) {
    final parsedDate = DateTime.parse(inputDate);
    return DateFormat('dd/MM/yyyy').format(parsedDate);
  }
  return null;
}

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    Color typeBackgroundColor = (userData?.type == "free")
        ? Color.fromRGBO(225, 220, 108, 100)
        : Color.fromARGB(255, 158, 255, 150);

    Color typeTextColor = (userData?.type == "free")
        ? Color.fromRGBO(176, 134, 1, 100)
        : Color.fromARGB(255, 15, 175, 1);

    return Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5), // Warna bayangan
                        spreadRadius: 2, // Menyebar ke luar
                        blurRadius: 5, // Besarnya blur
                        offset: Offset(0, 3), // Posisi bayangan (x, y)
                      ),
                    ],
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage("assets/profile.png"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 2),
                child: Container(
                  decoration: BoxDecoration(
                      color: typeBackgroundColor,
                      borderRadius: BorderRadius.circular(5)),
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  child: Text(
                    userData?.type ?? 'free',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: typeTextColor),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Text(
                  userData?.fullname ?? 'undefined',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 44, 62, 80)),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 2),
                child: Text(
                  userData?.email ?? 'undefined',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 2),
                child: Text(
                  "Member since : ${formatDate(userData?.createdAt)}",
                  style: TextStyle(fontSize: 11, color: Colors.grey),
                ),
              ),
              SizedBox(
                width: 60,
                child: Divider(
                  height: 15,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          ListTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EditProfilePage()));
            },
            title: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 26),
                    child: Text(
                      "Edit Profile",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 44, 62, 80)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 26, bottom: 10),
                    child: Text(
                      "Edit your profile data",
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                  Divider(
                    height: 15,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SubscriptionHistoriesPage()));
            },
            title: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 26),
                    child: Text(
                      "Subscription Histories",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 44, 62, 80)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 26, bottom: 10),
                    child: Text(
                      "All your subscription history",
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                  Divider(
                    height: 15,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
          ),
          ListTile(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return DialogSubscriptionStatus(userData!);
                },
              );
            },
            title: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 26, right: 32),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Subscription Status",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 44, 62, 80)),
                            ),
                            Text(
                              "Check your subscription status",
                              style: TextStyle(fontSize: 13),
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: typeBackgroundColor,
                              borderRadius: BorderRadius.circular(5)),
                          padding:
                              EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          child: Text(
                            userData?.type ?? 'free',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: typeTextColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 15,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
          ),
          ListTile(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return DialogChangeEmail();
                },
              );
            },
            title: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 26),
                    child: Text(
                      "Change Email Address",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 44, 62, 80)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 26, bottom: 10),
                    child: Text(
                      "Update your email address",
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                  Divider(
                    height: 15,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
          ),
          ListTile(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return DialogChangePassword();
                },
              );
            },
            title: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 26),
                    child: Text(
                      "Change Password",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 44, 62, 80)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 26, bottom: 10),
                    child: Text(
                      "Update your password",
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                  Divider(
                    height: 15,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
          ),
          ListTile(
            onTap: () async {
              final Email email = Email(
                recipients: ['help@attendances.id'],
                body:
                    'Dear Attendances Support Team,\n\nI need assistance with the Attendances application regarding [briefly describe the issue]. Kindly provide guidance or support to resolve this matter.\n\nThank you,\n[Your Name]\n[Your Contact Information]',
                subject: 'Assistance Needed: Attendances Application',
              );
              await FlutterEmailSender.send(email);
            },
            title: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 26),
                    child: Text(
                      "Help",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 44, 62, 80)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 26, bottom: 10),
                    child: Text(
                      "Get help from us : help@attendances.id",
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                  Divider(
                    height: 15,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AboutUsPage()));
            },
            title: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 26),
                    child: Text(
                      "About Us",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 44, 62, 80)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 26, bottom: 10),
                    child: Text(
                      "Get Information about us",
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                  Divider(
                    height: 15,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return DialogLogout();
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 190, 0, 57),
                  minimumSize: Size.fromHeight(35),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0))),
              child: Text(
                "Logout",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DialogLogout extends StatelessWidget {
  const DialogLogout({super.key});

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
          Text("You will be signed out of your account"),
          SizedBox(
            height: 28,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                  child: ElevatedButton(
                onPressed: () async {
                  final token = await SharedPreferencesHelper.getToken();
                  var response = await BaseClient()
                      .postWithToken("user/logout", jsonEncode({}), token!)
                      .catchError((err) {});

                  ApiResponse<dynamic> apiResponse = ApiResponse.fromJson(
                    json.decode(response.body),
                    (data) => data,
                  );

                  if (response.statusCode == 200 &&
                      apiResponse.success == true) {
                    SharedPreferencesHelper.clearToken();
                    await DBHelper.deleteData();
                    Fluttertoast.showToast(
                      msg: apiResponse.message,
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.black,
                      textColor: Colors.white,
                    );
                    // ignore: use_build_context_synchronously
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                      (route) => false,
                    );
                  } else {
                    Fluttertoast.showToast(
                      msg: apiResponse.message,
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.black,
                      textColor: Colors.white,
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 199, 0, 57),
                    minimumSize: Size.fromHeight(35),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                child: Text(
                  "Logout",
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

class DialogSubscriptionStatus extends StatelessWidget {
  final User userData;
  const DialogSubscriptionStatus(this.userData, {super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 70),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.close),
            ),
          ),
          Image.asset(
            (userData.type == "free")
                ? "assets/icon_free.png"
                : "assets/icon_premium.png",
            width: 90,
            height: 90,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            userData.type,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: (userData.type == "free")
                    ? Color.fromARGB(255, 175, 134, 1)
                    : Color.fromARGB(255, 15, 175, 1)),
          ),
          Text(
            "Valid until :",
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 44, 62, 80)),
          ),
          Text(
            (userData.type == "free") ? "-" : "10 January 2024",
            style:
                TextStyle(fontSize: 13, color: Color.fromARGB(255, 44, 62, 80)),
          ),
        ]),
      ),
    );
  }
}

class DialogChangeEmail extends StatelessWidget {
  const DialogChangeEmail({super.key});

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
          Text("Your email address will be changes!"),
          SizedBox(
            height: 20,
          ),
          SmallCustomTextFIeld("New Email Address"),
          SmallCustomPasswordTextFIeld("Your Current Password"),
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

class DialogChangePassword extends StatelessWidget {
  const DialogChangePassword({super.key});

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
          Text("Your password will be changes!"),
          SmallCustomPasswordTextFIeld("New Password"),
          SmallCustomPasswordTextFIeld("New Password Confirmation"),
          SmallCustomPasswordTextFIeld("Your Current Password"),
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
