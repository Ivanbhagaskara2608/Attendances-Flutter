import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/api_response.dart';
import 'package:flutter_application_1/pages/dashboard.dart';
import 'package:flutter_application_1/services/base_client.dart';
import 'package:flutter_application_1/shared_preferences_helper.dart';
import 'package:flutter_application_1/widgets/password_textfield.dart';
import 'package:flutter_application_1/widgets/textfield_custom.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatelessWidget {
  final CustomTextFIeld emailTextField = CustomTextFIeld("Email");
  final CustomPasswordTextFIeld passwordTextFIeld =
      CustomPasswordTextFIeld("Password");

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
        child: Column(children: [
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
            child: emailTextField,
          ),
          passwordTextFIeld,
          Spacer(),
          Container(
            margin: EdgeInsets.only(bottom: 30),
            child: Text(
              "Don’t have an account? Register",
              style: TextStyle(fontSize: 18),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                  child: ElevatedButton(
                      onPressed: () async {
                        var response = await BaseClient()
                            .login(jsonEncode({
                              "email": emailTextField.inputController.text,
                              "password": passwordTextFIeld.inputController.text
                            }))
                            .catchError((err) {});

                        ApiResponse<dynamic> apiResponse =
                              ApiResponse.fromJson(
                            json.decode(response.body),
                            (data) => data, 
                          );

                        if (response.statusCode == 200 && apiResponse.success == true) {
                          final token = apiResponse.data['api_token'];

                          SharedPreferencesHelper.saveToken(token);
                          showToast(apiResponse.message);
                          // ignore: use_build_context_synchronously
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Dashboard()));
                        } else {
                          showToast(apiResponse.message);
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
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
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
                      backgroundColor: const Color.fromARGB(255, 199, 0, 57)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 14),
                    child: Text("Back",
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  ))
            ],
          )
        ]),
      ),
    );
  }
}
