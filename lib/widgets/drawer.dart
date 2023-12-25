import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/subject.dart';
import 'package:flutter_application_1/model/user.dart';
import 'package:flutter_application_1/pages/buy_subscription_page.dart';
import 'package:flutter_application_1/pages/create_subject_page.dart';
import 'package:flutter_application_1/pages/dashboard.dart';
import 'package:flutter_application_1/pages/detail_subject.dart';
import 'package:flutter_application_1/pages/history_page.dart';
import 'package:flutter_application_1/pages/join_subject_page.dart';
import 'package:flutter_application_1/pages/settings_page.dart';

class CustomDrawer extends StatelessWidget {
  Widget buildDrawer(BuildContext context) {
    if (userData.type == "Free") {
      return ListTile(
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => BuySubscriptionPage()),
          );
        },
        visualDensity: VisualDensity(horizontal: 0, vertical: -4),
        leading: Icon(
          Icons.lock,
          size: 30,
          color: Colors.green,
        ),
        title: Text(
          "Buy Premium",
          style: TextStyle(fontSize: 20, color: Colors.green),
        ),
      );
    } else {
      return Container(); // Atau widget lain jika tidak memenuhi kondisi
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
            child: Row(
              children: [
                Image.asset("assets/logo_attendances.png",
                    width: 42, height: 42),
                Text("Attendances",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                Spacer(),
                Container(
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(225, 220, 108, 100),
                      borderRadius: BorderRadius.circular(5)),
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  child: Text(
                    "Free",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromRGBO(176, 134, 1, 100)),
                  ),
                )
              ],
            ),
          ),
          Divider(
            height: 10,
            color: Colors.black,
          ),
          ListTile(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Dashboard()));
              },
              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
              leading: Icon(
                Icons.home,
                size: 30,
              ),
              title: Text("Home", style: TextStyle(fontSize: 20))),
          ListTile(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HistoryPage()));
              },
              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
              leading: Icon(
                Icons.history,
                size: 30,
              ),
              title: Text("History", style: TextStyle(fontSize: 20))),
          buildDrawer(context),
          ListTile(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => SettingsPage()));
              },
              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
              leading: Icon(
                Icons.settings,
                size: 30,
              ),
              title: Text("Settings", style: TextStyle(fontSize: 20))),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              height: 15,
              color: Colors.black,
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 24, bottom: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Your Created Subject",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                ),
              )),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount:
                  subjects.where((subject) => subject.type == "created").length,
              itemBuilder: (context, index) {
                Subject currentCreatedSubjects = subjects
                    .where((subject) => subject.type == "created")
                    .toList()[index];

                return ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DetailSubjectPage(currentCreatedSubjects)));
                  },
                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                  leading: CircleAvatar(
                    backgroundColor: const Color.fromARGB(255, 66, 66, 66),
                    maxRadius: 15,
                    child: Text(
                      currentCreatedSubjects.title[0].toUpperCase(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  title: Text(
                    currentCreatedSubjects.title,
                    style: TextStyle(fontSize: 20),
                  ),
                );
              },
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              height: 15,
              color: Colors.black,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 24, bottom: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Your Joined Subject",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount:
                  subjects.where((subject) => subject.type == "joined").length,
              itemBuilder: (context, index) {
                Subject currentJoinedSubjects = subjects
                    .where((subject) => subject.type == "joined")
                    .toList()[index];

                return ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DetailSubjectPage(currentJoinedSubjects)));
                  },
                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                  leading: CircleAvatar(
                    backgroundColor: const Color.fromARGB(255, 66, 66, 66),
                    maxRadius: 15,
                    child: Text(
                      currentJoinedSubjects.title[0].toUpperCase(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  title: Text(
                    currentJoinedSubjects.title,
                    style: TextStyle(fontSize: 20),
                  ),
                );
              },
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              height: 15,
              color: Colors.black,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => JoinSubjectPage()));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: Size.fromHeight(30),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0))),
              child: Text(
                "Join Subject",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.white),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CreateSubjectPage()));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 44, 62, 80),
                  minimumSize: Size.fromHeight(30),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0))),
              child: Text(
                "Create New Subject",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
