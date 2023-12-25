import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarTextField extends StatefulWidget {
  final String hintName;

  CalendarTextField(this.hintName);
  @override
  // ignore: library_private_types_in_public_api
  _CalendarTextFieldState createState() => _CalendarTextFieldState();
}

class _CalendarTextFieldState extends State<CalendarTextField> {
  final inputController = TextEditingController();

  @override
  void initState() {
    super.initState();

    inputController.addListener(() {
      setState(() {});
    });

    inputController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(
              2000), //DateTime.now() - not to allow to choose before today.
          lastDate: DateTime(2101),
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme:
                    ColorScheme.light(primary: Color.fromARGB(255, 44, 62, 80)),
              ),
              child: child!,
            );
          },
        );

        if (pickedDate != null) {
          print(
              pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
          String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
          print(
              formattedDate); //formatted date output using intl package =>  2021-03-16
          //you can implement different kind of Date Format here according to your requirement

          setState(() {
            inputController.text =
                formattedDate; //set output date to TextField value.
          });
        } else {
          print("Date is not selected");
        }
      },
      controller: inputController,
      decoration: InputDecoration(
          hintText: widget.hintName,
          prefixIcon: Icon(Icons.calendar_month_rounded),
          prefixIconColor: Color.fromARGB(255, 44, 62, 80),
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
              borderSide: BorderSide(
                  color: Color.fromARGB(255, 44, 62, 80), width: 2))),
    );
  }
}
