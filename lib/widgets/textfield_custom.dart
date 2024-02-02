import 'package:flutter/material.dart';

class CustomTextFIeld extends StatefulWidget {
  final String hintName;

  CustomTextFIeld(this.hintName);

  TextEditingController get inputController => _CustomTextFIeldState._inputController;

  @override
  _CustomTextFIeldState createState() => _CustomTextFIeldState();
}

class _CustomTextFIeldState extends State<CustomTextFIeld> {
  static final TextEditingController _inputController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _inputController.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Color.fromARGB(255, 44, 62, 80),
      controller: _inputController,
      decoration: InputDecoration(
        hintText: widget.hintName,
        suffixIcon: _inputController.text.isEmpty
            ? Container(width: 0)
            : IconButton(
                icon: Icon(Icons.close, color: Color.fromARGB(255, 190, 0, 57)),
                onPressed: () => _inputController.clear(),
              ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.black, width: 1),
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
