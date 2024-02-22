import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/api_response.dart';
import 'package:flutter_application_1/pages/login.dart';
import 'package:flutter_application_1/services/base_client.dart';
import 'package:flutter_application_1/widgets/calendar_textfield.dart';
import 'package:flutter_application_1/widgets/dialog_error.dart';
import 'package:flutter_application_1/widgets/dropdown_custom.dart';
import 'package:flutter_application_1/widgets/password_textfield.dart';
import 'package:flutter_application_1/widgets/textfield_custom.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ignore: must_be_immutable
class Register extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController birthdateController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<String> genderItems = [
    'Male',
    'Female',
  ];
  String? selectedGender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.only(top: 70),
                child: Text(
                  "Let's get started by logging in to your account",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 44, 62, 80)),
                ),
              ),
              SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: CustomTextFIeld(
                    hintName: "Email",
                    isRequired: true,
                    isEmail: true,
                    minLength: 0,
                    maxLength: null,
                    controller: emailController),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: CustomTextFIeld(
                    hintName: "Fullname",
                    isRequired: true,
                    isEmail: false,
                    minLength: 3,
                    maxLength: 72,
                    controller: fullNameController),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: CustomDropdownFormField(
                  items: genderItems,
                  onChanged: (value) {
                    // Perbarui nilai selectedGender saat dropdown berubah
                    selectedGender = value;
                  },
                  selectedValue: selectedGender,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: CalendarTextField(
                  hintName: "Birthdate",
                  isRequired: true,
                  isBirthdate: true,
                  controller: birthdateController,
                ),
              ),
              CustomPasswordTextField(
                  hintName: "Password", controller: passwordController),
              CustomPasswordTextField(
                  hintName: "Password Confirmation",
                  controller: passwordConfirmController),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(bottom: 30, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(fontSize: 18),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      },
                      child: Text(" Login",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 44, 62, 80))),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                      child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              var response = await BaseClient()
                                  .post(
                                      "user/register",
                                      jsonEncode({
                                        "email": emailController.text,
                                        "full_name": fullNameController.text,
                                        "gender": selectedGender!.toLowerCase(),
                                        "birthdate": birthdateController.text,
                                        "password": passwordController.text,
                                        "password_confirmation":
                                            passwordConfirmController.text
                                      }))
                                  .catchError((err) {});

                              ApiResponse<dynamic> apiResponse =
                                  ApiResponse.fromJson(
                                json.decode(response.body),
                                (data) => data,
                              );

                              if (response.statusCode == 200 &&
                                  apiResponse.success == true) {
                                Fluttertoast.showToast(
                                  msg: apiResponse.message,
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  backgroundColor: Colors.black,
                                  textColor: Colors.white,
                                );
                                // ignore: use_build_context_synchronously
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Login()));
                              } else {
                                // ignore: use_build_context_synchronously
                                showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (context) {
                                    return CustomDialogError(
                                        "Oops! Register failed. Please make sure your data are correct.");
                                  },
                                );
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              backgroundColor:
                                  const Color.fromARGB(255, 44, 62, 80)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 14),
                            child: Text("Register",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white)),
                          ))),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          backgroundColor:
                              const Color.fromARGB(255, 199, 0, 57)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 14),
                        child: Text("Back",
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
                      ))
                ],
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
