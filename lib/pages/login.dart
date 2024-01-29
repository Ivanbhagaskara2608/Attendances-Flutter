import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/dashboard.dart';
import 'package:flutter_application_1/widgets/password_textfield.dart';
import 'package:flutter_application_1/widgets/textfield_custom.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatelessWidget {
  final CustomTextFIeld usernameTextField = CustomTextFIeld("Username");

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
            child: usernameTextField,
          ),
          CustomPasswordTextFIeld("Password"),
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
                      onPressed: () {
                        // String usernameValue =
                        //     usernameTextField.inputController.text;
                        // showToast("Username: $usernameValue");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Dashboard()));
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
