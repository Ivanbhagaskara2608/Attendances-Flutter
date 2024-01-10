import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/model/subject.dart';
import 'package:flutter_application_1/pages/edit_subject_page.dart';

class SubjectSettingsPage extends StatelessWidget {
  final Subject currentSubject;

  const SubjectSettingsPage(this.currentSubject, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 66, 66, 66),
              radius: 70,
              child: Text(
                currentSubject.title[0].toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 70,
                  color: Colors.white,
                ),
              ), // Use AssetImage here
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 2),
            child: Text(
              currentSubject.title,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 44, 62, 80)),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 2),
            child: Text(
              currentSubject.description,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 2),
            child: Text(
              "Created by : ${currentSubject.createdBy}",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 2),
            child: Text(
              "Since : 18/07/2023",
              style: TextStyle(fontSize: 11, color: Colors.grey),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  currentSubject.code,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
                SizedBox(width: 10),
                InkWell(
                  onTap: () async {
                    await Clipboard.setData(
                        ClipboardData(text: currentSubject.code));
                    // copied successfully
                  },
                  child: Icon(
                    Icons.copy,
                    color: Colors.grey,
                    size: 18,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 60,
            child: Divider(
              height: 15,
              color: Colors.grey,
            ),
          ),
        ]),
        if (currentSubject.type == "created")
          Column(
            children: [
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              EditSubjectPage(currentSubject)));
                },
                title: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 26),
                        child: Text(
                          "Edit Subject",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 44, 62, 80)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 26, bottom: 10),
                        child: Text(
                          "Edit subject data",
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
                        return DialogChangeCode();
                      });
                },
                title: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 26),
                        child: Text(
                          "Change Invite Code",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 44, 62, 80)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 26, bottom: 10),
                        child: Text(
                          "Update Invite Code Subject",
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
            ],
          ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: ElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return DialogLeave();
                  });
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 190, 0, 57),
                minimumSize: Size.fromHeight(35),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0))),
            child: Text(
              "Leave Subject",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

class DialogChangeCode extends StatelessWidget {
  const DialogChangeCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 70),
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
          Text(
            "You will be change invite code for this subject",
            textAlign: TextAlign.center,
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
                  "Confirm",
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

class DialogLeave extends StatelessWidget {
  const DialogLeave({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 70),
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
          Text(
            "You will be leave this subject",
            textAlign: TextAlign.center,
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
                  "Leave",
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
