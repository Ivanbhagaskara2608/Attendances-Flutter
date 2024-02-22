import 'package:flutter/material.dart';

class CustomTextFIeld extends StatefulWidget {
  final String hintName;
  final bool isRequired;
  final bool isEmail;
  final int minLength;
  final int? maxLength;
  final TextEditingController controller;

  CustomTextFIeld(
      {required this.hintName,
      required this.isRequired,
      required this.isEmail,
      required this.minLength,
      required this.maxLength,
      required this.controller});

  @override
  State<CustomTextFIeld> createState() => _CustomTextFIeldState();
}

class _CustomTextFIeldState extends State<CustomTextFIeld> {
  @override
  void initState() {
    widget.controller.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (widget.isRequired) {
          if (value!.isEmpty) {
            return '${widget.hintName} is required';
          }
        }
        if (value!.length < widget.minLength ||
            (widget.maxLength != null && value.length > widget.maxLength!)) {
          return "${widget.hintName} should be between ${widget.minLength} and ${widget.maxLength} characters";
        }
        if (widget.isEmail) {
          const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
              r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
              r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
              r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
              r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
              r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
              r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
          final regex = RegExp(pattern);
          return !regex.hasMatch(value) ? 'Enter a valid email address' : null;
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorColor: Color.fromARGB(255, 44, 62, 80),
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hintName,
        suffixIcon: widget.controller.text.isEmpty
            ? Container(width: 0)
            : IconButton(
                icon: Icon(Icons.close, color: Color.fromARGB(255, 190, 0, 57)),
                onPressed: () => widget.controller.clear(),
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
    );
  }
}
