import 'package:flutter/material.dart';

class SmallCustomTextFIeld extends StatefulWidget {
  final String hintName;

  SmallCustomTextFIeld(this.hintName);
  @override
  // ignore: library_private_types_in_public_api
  _SmallCustomTextFIeldState createState() => _SmallCustomTextFIeldState();
}

class _SmallCustomTextFIeldState extends State<SmallCustomTextFIeld> {
  final inputController = TextEditingController();

  @override
  void initState() {
    super.initState();

    inputController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Color.fromARGB(255, 44, 62, 80),
      controller: inputController,
      decoration: InputDecoration(
          hintText: widget.hintName,
          suffixIcon: inputController.text.isEmpty
              ? Container(width: 0)
              : IconButton(
                  icon:
                      Icon(Icons.close, color: Color.fromARGB(255, 190, 0, 57)),
                  onPressed: () => inputController.clear(),
                ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.black, width: 1)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide:
                  BorderSide(color: Color.fromARGB(255, 44, 62, 80), width: 2)),
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12)),
    );
  }
}
