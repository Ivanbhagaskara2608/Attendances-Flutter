import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DropDownStatus extends StatelessWidget {
  final List<String> items;
  String? selectedValue;

  DropDownStatus(
    this.items,
    this.selectedValue,
  );

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<String>(
      style: TextStyle(fontSize: 12, color: Color.fromARGB(255, 44, 62, 80)),
      isExpanded: true,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 3, horizontal: 5),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Colors.grey, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: Color.fromARGB(255, 44, 62, 80),
            width: 2,
          ),
        ),
      ),
      value: items[0],
      items: items
          .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              ))
          .toList(),
      validator: (value) {
        if (value == null) {
          return 'Please select.';
        }
        return null;
      },
      onChanged: (value) {
        // Do something when the selected item is changed.
      },
      onSaved: (value) {
        selectedValue = value.toString();
      },
      iconStyleData: const IconStyleData(
        icon: Icon(
          Icons.keyboard_arrow_down,
          color: Color.fromARGB(255, 44, 62, 80),
        ),
        iconSize: 20,
      ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      menuItemStyleData: const MenuItemStyleData(
        padding: EdgeInsets.symmetric(horizontal: 3),
      ),
    );
  }
}
