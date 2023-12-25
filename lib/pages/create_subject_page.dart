import 'package:flutter/material.dart';

class CreateSubjectPage extends StatelessWidget {
  const CreateSubjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Create Subject",
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
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Title :",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 44, 62, 80)),
            ),
            TextField(
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
                  "Create",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.white),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 220, 108),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                child: Text(
                  textAlign: TextAlign.center,
                  "Your max created subject: 3",
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 175, 134, 1)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
