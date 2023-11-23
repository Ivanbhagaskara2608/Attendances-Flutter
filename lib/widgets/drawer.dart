import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/subject.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
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
              onTap: () {},
              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
              leading: Icon(
                Icons.home,
                size: 30,
              ),
              title: Text("Home", style: TextStyle(fontSize: 20))),
          ListTile(
              onTap: () {},
              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
              leading: Icon(
                Icons.history,
                size: 30,
              ),
              title: Text("History", style: TextStyle(fontSize: 20))),
          ListTile(
              onTap: () {},
              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
              leading: Icon(
                Icons.lock,
                size: 30,
                color: Colors.green,
              ),
              title: Text("Buy Premium",
                  style: TextStyle(fontSize: 20, color: Colors.green))),
          ListTile(
              onTap: () {},
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
              itemCount: createdSubjects.length,
              itemBuilder: (context, index) {
                Subject currentSubject = createdSubjects[index];

                return ListTile(
                  onTap: () {
                    print("Subject: ${currentSubject.title}");
                  },
                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                  leading: CircleAvatar(
                    backgroundColor: const Color.fromARGB(255, 66, 66, 66),
                    maxRadius: 15,
                    child: Text(
                      currentSubject.title[0],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  title: Text(
                    currentSubject.title,
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
              itemCount: joinedSubjects.length,
              itemBuilder: (context, index) {
                Subject currentJoinedSubjects = joinedSubjects[index];

                return ListTile(
                  onTap: () {
                    print("Subject: ${currentJoinedSubjects.title}");
                  },
                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                  leading: CircleAvatar(
                    backgroundColor: const Color.fromARGB(255, 66, 66, 66),
                    maxRadius: 15,
                    child: Text(
                      currentJoinedSubjects.title[0],
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
              onPressed: () {},
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
              onPressed: () {},
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
