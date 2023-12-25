import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/user.dart';
import 'package:flutter_application_1/widgets/calendar_textfield.dart';
import 'package:flutter_application_1/widgets/dropdown_custom.dart';
import 'package:flutter_application_1/widgets/textfield_custom.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> genderItems = [
      'Male',
      'Female',
    ];
    String? selectedValue;
    Color typeBackgroundColor = (userData.type == "Free")
        ? Color.fromRGBO(225, 220, 108, 100)
        : Color.fromARGB(255, 158, 255, 150);

    Color typeTextColor = (userData.type == "Free")
        ? Color.fromRGBO(176, 134, 1, 100)
        : Color.fromARGB(255, 15, 175, 1);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Profile",
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
      body: ListView(children: [
        Column(
          children: [
            Stack(
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
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: InkWell(
                      onTap: () {},
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 44, 62, 80),
                        maxRadius: 15,
                        child: Icon(
                          Icons.edit_square,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 2),
              child: Container(
                decoration: BoxDecoration(
                    color: typeBackgroundColor,
                    borderRadius: BorderRadius.circular(5)),
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                child: Text(
                  userData.type,
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
                userData.fullname,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 44, 62, 80)),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 2),
              child: Text(
                userData.email,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: CustomTextFIeld("Fullname"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: CustomDropdownFormField(
                  items: genderItems,
                  selectedValue: selectedValue,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: CalendarTextField("Birthdate"),
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
                    "Save",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                width: 60,
                child: Divider(
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 190, 0, 57),
                      minimumSize: Size.fromHeight(35),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                  child: Text(
                    "Delete My Account",
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
      ]),
    );
  }
}
