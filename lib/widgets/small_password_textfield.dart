import 'package:flutter/material.dart';

class SmallCustomPasswordTextFIeld extends StatefulWidget {
  final String hintName;

  SmallCustomPasswordTextFIeld(this.hintName);
  @override
  // ignore: library_private_types_in_public_api
  _SmallCustomPasswordTextFIeldState createState() =>
      _SmallCustomPasswordTextFIeldState();
}

class _SmallCustomPasswordTextFIeldState
    extends State<SmallCustomPasswordTextFIeld> {
  final inputController = TextEditingController();
  String password = "";
  bool isPasswordVisible = true;

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
                borderSide: BorderSide(color: Colors.black, width: 1)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                    color: Color.fromARGB(255, 44, 62, 80), width: 2)),
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12)),
      ),
    );
  }
}
