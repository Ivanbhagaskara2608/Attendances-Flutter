import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                  child:
                      ElevatedButton(onPressed: () {}, child: Text("Login"))),
              Expanded(
                  child: ElevatedButton(
                      onPressed: () {}, child: Text("Register"))),
            ],
          )
        ],
      ),
    ));
  }
}
