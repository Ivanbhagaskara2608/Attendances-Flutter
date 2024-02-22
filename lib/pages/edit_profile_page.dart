import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/database/db_helper.dart';
import 'package:flutter_application_1/helper/image_helper.dart';
import 'package:flutter_application_1/model/api_response.dart';
import 'package:flutter_application_1/model/user.dart';
import 'package:flutter_application_1/pages/settings_page.dart';
import 'package:flutter_application_1/services/base_client.dart';
import 'package:flutter_application_1/shared_preferences_helper.dart';
import 'package:flutter_application_1/widgets/calendar_textfield.dart';
import 'package:flutter_application_1/widgets/dialog_error.dart';
import 'package:flutter_application_1/widgets/dropdown_custom.dart';
import 'package:flutter_application_1/widgets/small_password_textfield.dart';
import 'package:flutter_application_1/widgets/textfield_custom.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_cropper/image_cropper.dart';

final imageHelper = ImageHelper();

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  User? userData;
  File? _image;
  void getData() async {
    final user = await DBHelper.getUser();
    setState(() {
      userData = user;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController fullNameController = TextEditingController();
    TextEditingController birthdateController = TextEditingController();
    fullNameController.text = userData?.fullname ?? 'undefined';
    birthdateController.text = userData?.birthdate ?? 'undefined';
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final List<String> genderItems = [
      'Male',
      'Female',
    ];
    String? selectedGender;
    Color typeBackgroundColor = (userData?.type == "free")
        ? Color.fromRGBO(225, 220, 108, 100)
        : Color.fromARGB(255, 158, 255, 150);

    Color typeTextColor = (userData?.type == "free")
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
                      backgroundColor: Colors.grey,
                      radius: 70,
                      foregroundImage: _image != null
                          ? FileImage(_image!)
                          : null, // Menggunakan null jika _image null
                      child: _image == null
                          ? Icon(Icons.person,
                              size: 70,
                              color: Colors
                                  .white) // Menampilkan Icon jika _image null
                          : null, // Menggunakan null jika _image tidak null
                    ),
                  ),
                ),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: InkWell(
                      onTap: () async {
                        showModalBottomSheet(
                            context: context,
                            builder: (builder) {
                              return Card(
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height / 6,
                                  padding: EdgeInsets.all(10),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: InkWell(
                                        child: Column(
                                          children: [
                                            Icon(
                                              Icons.image,
                                              color: Color.fromARGB(
                                                  255, 44, 62, 80),
                                              size: 50,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "Gallery",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 44, 62, 80)),
                                            )
                                          ],
                                        ),
                                        onTap: () async {
                                          final files =
                                              await imageHelper.pickImage();
                                          if (files.isNotEmpty) {
                                            final croppedFile =
                                                await imageHelper.crop(
                                                    file: files.first,
                                                    cropStyle:
                                                        CropStyle.circle);
                                            if (croppedFile != null) {
                                              setState(() {
                                                _image = File(croppedFile.path);
                                                print(_image);
                                              });
                                            }
                                          }
                                        },
                                      )),
                                      Expanded(
                                          child: InkWell(
                                        child: Column(
                                          children: [
                                            Icon(
                                              Icons.camera_alt,
                                              color: Color.fromARGB(
                                                  255, 44, 62, 80),
                                              size: 50,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "Camera",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 44, 62, 80)),
                                            )
                                          ],
                                        ),
                                        onTap: () async {
                                          final files =
                                              await imageHelper.camera();
                                          if (files != null) {
                                            final croppedFile =
                                                await imageHelper.crop(
                                                    file: files,
                                                    cropStyle:
                                                        CropStyle.circle);
                                            if (croppedFile != null) {
                                              setState(() {
                                                _image = File(croppedFile.path);
                                                print(_image);
                                              });
                                            }
                                          }
                                        },
                                      ))
                                    ],
                                  ),
                                ),
                              );
                            });
                      },
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
                textAlign: TextAlign.center,
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
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: CustomTextFIeld(
                      hintName: "Fullname",
                      isRequired: true,
                      isEmail: false,
                      minLength: 3,
                      maxLength: 72,
                      controller: fullNameController),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: CustomDropdownFormField(
                    items: genderItems,
                    onChanged: (value) {
                      // Perbarui nilai selectedGender saat dropdown berubah
                      selectedGender = value;
                    },
                    selectedValue: userData?.gender,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: CalendarTextField(
                      hintName: "Birthdate",
                      isRequired: true,
                      isBirthdate: true,
                      controller: birthdateController),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) {
                            return DialogEditProfile(
                                fullNameController.text,
                                selectedGender?.toLowerCase() ??
                                    userData!.gender,
                                birthdateController.text);
                          },
                        );
                      }
                    },
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
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return DialogDeleteAccount();
                        },
                      );
                    },
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
        ),
      ]),
    );
  }
}

class DialogEditProfile extends StatelessWidget {
  final String fullname;
  final String gender;
  final String birthdate;
  const DialogEditProfile(this.fullname, this.gender, this.birthdate,
      {super.key});

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
          Text("You won't be able to revert this!"),
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
                      .postWithToken(
                          "user/update-profile",
                          jsonEncode({
                            "fullname": fullname,
                            "gender": gender,
                            "birthdate": birthdate,
                          }),
                          token!)
                      .catchError((err) {});
                  ApiResponse<User> apiResponse = ApiResponse.fromJson(
                    json.decode(response.body),
                    (data) => User.fromJson(data),
                  );

                  if (response.statusCode == 200 &&
                      apiResponse.success == true) {
                    await DBHelper.updateUser(apiResponse.data);
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).pop();
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
                      MaterialPageRoute(builder: (context) => SettingsPage()),
                      (route) => false,
                    );
                  } else {
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).pop();
                    // ignore: use_build_context_synchronously
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return CustomDialogError(
                            "Oops! Update profile failed. Please make sure your data are correct.");
                      },
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 44, 62, 80),
                    minimumSize: Size.fromHeight(35),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                child: Text(
                  "Proceed",
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
                    backgroundColor: Color.fromARGB(255, 199, 0, 57),
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

class DialogDeleteAccount extends StatelessWidget {
  const DialogDeleteAccount({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController passwordController = TextEditingController();
    return Dialog(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 35),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Image.asset("assets/icon_danger.png", width: 80, height: 80),
          SizedBox(
            height: 10,
          ),
          Text(
            "Are you sure?",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 199, 0, 57)),
          ),
          Text("You can't restore your account again!"),
          SmallCustomPasswordTextFIeld(
              hintName: "Your Current Password",
              controller: passwordController),
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
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 175, 134, 1),
                minimumSize: Size.fromHeight(35),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0))),
            child: Text(
              "No, i'm just want to logout",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Colors.white),
            ),
          )
        ]),
      ),
    );
  }
}
