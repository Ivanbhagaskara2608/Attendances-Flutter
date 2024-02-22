import 'package:flutter/material.dart';

class SmallCustomPasswordTextFIeld extends StatefulWidget {
  final String hintName;
  final TextEditingController controller;

  SmallCustomPasswordTextFIeld({
    required this.hintName,
    required this.controller,
  });

  @override
  State<SmallCustomPasswordTextFIeld> createState() =>
      _SmallCustomPasswordTextFIeldState();
}

class _SmallCustomPasswordTextFIeldState
    extends State<SmallCustomPasswordTextFIeld> {
  bool isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return '${widget.hintName} is required';
          }
          if ((value.length < 8 || value.length >= 64)) {
            return "${widget.hintName} should be between 8 and 64 characters";
          }
          return null;
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        cursorColor: Color.fromARGB(255, 44, 62, 80),
        controller: widget.controller,
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
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide:
                  BorderSide(color: Color.fromARGB(255, 190, 0, 57), width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.black, width: 1),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: Color.fromARGB(255, 190, 0, 57),
                width: 2,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: Color.fromARGB(255, 44, 62, 80),
                width: 2,
              ),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12)),
      ),
    );
  }
}
