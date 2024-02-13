import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/api_response.dart';
import 'package:flutter_application_1/pages/dashboard.dart';
import 'package:flutter_application_1/pages/register.dart';
import 'package:flutter_application_1/services/base_client.dart';
import 'package:flutter_application_1/shared_preferences_helper.dart';
import 'package:flutter_application_1/widgets/dialog_error.dart';
import 'package:flutter_application_1/widgets/password_textfield.dart';
import 'package:flutter_application_1/widgets/textfield_custom.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ignore: must_be_immutable
class Login extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black,
      textColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Form(
            key: _formKey,
            child: Column(
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
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: CustomTextFIeld(
                      hintName: "Email",
                      isRequired: true,
                      isEmail: true,
                      minLength: 0,
                      controller: emailController),
                ),
                CustomPasswordTextField(
                    hintName: "Password", controller: passwordController),
                Spacer(),
                Container(
                  margin: EdgeInsets.only(bottom: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don’t have an account?",
                        style: TextStyle(fontSize: 18),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Register()));
                        },
                        child: Text(" Register",
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
                                        "user/login",
                                        jsonEncode({
                                          "email": emailController.text,
                                          "password": passwordController.text
                                        }))
                                    .catchError((err) {});

                                ApiResponse<dynamic> apiResponse =
                                    ApiResponse.fromJson(
                                  json.decode(response.body),
                                  (data) => data,
                                );

                                if (response.statusCode == 200 &&
                                    apiResponse.success == true) {
                                  final token = apiResponse.data['api_token'];

                                  SharedPreferencesHelper.saveToken(token);
                                  showToast(apiResponse.message);
                                  // ignore: use_build_context_synchronously
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Dashboard()));
                                } else {
                                  // ignore: use_build_context_synchronously
                                  showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (context) {
                                      return CustomDialogError(
                                          "Oops! Login failed. Please make sure your email and password are correct.");
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
                              child: Text("Login",
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
                )
              ],
            )),
      ),
    );
  }
}
