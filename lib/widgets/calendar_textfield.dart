import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarTextField extends StatefulWidget {
  final String hintName;
  final bool isRequired;
  final bool isBirthdate;
  final TextEditingController controller;

  CalendarTextField(
      {required this.hintName,
      required this.isRequired,
      required this.isBirthdate,
      required this.controller});

  @override
  State<CalendarTextField> createState() => _CalendarTextFieldState();
}

class _CalendarTextFieldState extends State<CalendarTextField> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      setState(() {});
    });
    // widget.controller.text = "";
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
        if (widget.isBirthdate) {
          DateTime selectedDate = DateFormat('yyyy-MM-dd').parse(value!);
          DateTime today = DateTime.now();
          today = DateTime(today.year, today.month, today.day);

          if (selectedDate.isAtSameMomentAs(today) ||
              selectedDate.isAfter(today)) {
            return 'Please select a date before today';
          }
        }
        return null;
      },
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
          String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);

          setState(() {
            widget.controller.text = formattedDate;
          });
        }
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hintName,
        prefixIcon: Icon(Icons.calendar_month_rounded),
        prefixIconColor: Color.fromARGB(255, 44, 62, 80),
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
