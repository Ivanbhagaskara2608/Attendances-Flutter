import 'package:flutter/material.dart';

class CustomDialogSuccess extends StatelessWidget {
  final String message;
  const CustomDialogSuccess(this.message, {super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 35),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Image.asset("assets/icon_check_circle.png", width: 80, height: 80),
          SizedBox(
            height: 10,
          ),
          Text(
            "Success",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 15, 175, 1)),
          ),
          Text(
            message,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 44, 62, 80),
                minimumSize: Size.fromHeight(35),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0))),
            child: Text(
              "Close",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Colors.white),
            ),
          ),
        ]),
      ),
    );
  }
}
