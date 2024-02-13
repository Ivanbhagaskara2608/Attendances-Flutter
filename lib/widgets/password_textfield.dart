import 'package:flutter/material.dart';

class CustomPasswordTextField extends StatefulWidget {
  final String hintName;
  final TextEditingController controller;

  CustomPasswordTextField({required this.hintName, required this.controller});

  @override
  // ignore: library_private_types_in_public_api
  _CustomPasswordTextFieldState createState() =>
      _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  String password = "";
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
          if (value.length < 8) {
            return "${widget.hintName} should be at least 8 characters";
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
        ),
      ),
    );
  }
}
