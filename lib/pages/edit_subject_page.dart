import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/subject.dart';

class EditSubjectPage extends StatefulWidget {
  final Subject currentSubject;

  const EditSubjectPage(this.currentSubject, {super.key});

  @override
  State<EditSubjectPage> createState() => _EditSubjectPageState();
}

class _EditSubjectPageState extends State<EditSubjectPage> {
  late TextEditingController titleController =
      TextEditingController(text: widget.currentSubject.title);
  late TextEditingController descriptionController =
      TextEditingController(text: widget.currentSubject.description);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Subject",
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
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: CircleAvatar(
                  backgroundColor: const Color.fromARGB(255, 66, 66, 66),
                  radius: 70,
                  child: Text(
                    widget.currentSubject.title[0].toUpperCase(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 70,
                      color: Colors.white,
                    ),
                  ), // Use AssetImage here
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
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
              "Description :",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 44, 62, 80)),
            ),
            TextField(
              controller: descriptionController,
              cursorColor: Color.fromARGB(255, 44, 62, 80),
              decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 44, 62, 80)))),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 44, 62, 80),
                    minimumSize: Size.fromHeight(35),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                child: Text(
                  "Edit Subject",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
