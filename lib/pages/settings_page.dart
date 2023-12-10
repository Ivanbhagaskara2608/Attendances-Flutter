import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/app_bar.dart';
import 'package:flutter_application_1/widgets/drawer.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: CircleAvatar(
                  radius: 70,
                  backgroundImage:
                      AssetImage("assets/profile.png"), // Use AssetImage here
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 2),
                child: Container(
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
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Text(
                  "Ivan Bhagaskara K",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 44, 62, 80)),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 2),
                child: Text(
                  "ivanbhagas@gmail.com",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 2),
                child: Text(
                  "Member since : 18/07/2023",
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
            onTap: () {},
            title: Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 24),
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
            onTap: () {},
            title: Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 24),
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
            onTap: () {},
            title: Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 24),
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
                              color: const Color.fromRGBO(225, 220, 108, 100),
                              borderRadius: BorderRadius.circular(5)),
                          padding:
                              EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          child: Text(
                            "Free",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromRGBO(176, 134, 1, 100)),
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
            onTap: () {},
            title: Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 24),
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
            onTap: () {},
            title: Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 24),
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
            onTap: () {},
            title: Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 24),
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
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 190, 0, 57),
                  minimumSize: Size.fromHeight(35),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0))),
              child: Text(
                "Reset All Filter",
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
