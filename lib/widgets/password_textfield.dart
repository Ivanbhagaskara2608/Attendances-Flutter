import 'package:flutter/material.dart';

class CustomPasswordTextFIeld extends StatefulWidget {
  final String hintName;

  CustomPasswordTextFIeld(this.hintName);
  @override
  // ignore: library_private_types_in_public_api
  _CustomPasswordTextFIeldState createState() =>
      _CustomPasswordTextFIeldState();
}

class _CustomPasswordTextFIeldState extends State<CustomPasswordTextFIeld> {
  final inputController = TextEditingController();
  String password = "";
  bool isPasswordVisible = false;

  @override
  void initState() {
    super.initState();

    inputController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: TextField(
        onChanged: (value) => setState(() => password = value),
        onSubmitted: (value) => setState(() => password = value),
        controller: inputController,
        obscureText: isPasswordVisible,
        decoration: InputDecoration(
            hintText: widget.hintName,
            suffixIcon: IconButton(
              icon: isPasswordVisible
                  ? Icon(Icons.visibility_off,
                      color: Color.fromARGB(255, 44, 62, 80))
                  : Icon(Icons.visibility,
                      color: Color.fromARGB(255, 44, 62, 80)),
              onPressed: () {
                setState(() {
                  isPasswordVisible = !isPasswordVisible;
                });
              },
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.black, width: 2)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                    color: Color.fromARGB(255, 44, 62, 80), width: 2))),
      ),
    );
  }
}
