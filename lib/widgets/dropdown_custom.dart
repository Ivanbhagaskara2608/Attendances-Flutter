import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

// ignore: must_be_immutable
class CustomDropdownFormField extends StatelessWidget {
  final List<String> items;
  String? selectedValue;

  CustomDropdownFormField({
    required this.items,
    required this.selectedValue,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<String>(
      isExpanded: true,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
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
      hint: const Text('Select Your Gender'),
      items: items
          .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              ))
          .toList(),
      validator: (value) {
        if (value == null) {
          return 'Please select gender.';
        }
        return null;
      },
      onChanged: (value) {
        // Do something when the selected item is changed.
      },
      onSaved: (value) {
        selectedValue = value.toString();
      },
      buttonStyleData: const ButtonStyleData(
        padding: EdgeInsets.only(right: 8),
      ),
      iconStyleData: const IconStyleData(
        icon: Icon(
          Icons.arrow_drop_down,
          color: Color.fromARGB(255, 44, 62, 80),
        ),
        iconSize: 24,
      ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      menuItemStyleData: const MenuItemStyleData(
        padding: EdgeInsets.symmetric(horizontal: 16),
      ),
    );
  }
}
