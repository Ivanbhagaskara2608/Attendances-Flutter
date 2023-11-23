import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/login.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(),
          Text(
            "Welcome to",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 44, 62, 80)),
          ),
          Text(
            "Attendances",
            style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 44, 62, 80)),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()));
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
              Expanded(
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          backgroundColor:
                              const Color.fromARGB(255, 44, 62, 80)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 14),
                        child: Text("Register",
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
                      ))),
            ],
          )
        ],
      ),
    ));
  }
}
