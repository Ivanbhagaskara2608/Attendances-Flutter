import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

// ignore: must_be_immutable
class CustomDropdownFormField extends StatelessWidget {
  final List<String> items;
  final ValueChanged<String?> onChanged;
  String? selectedValue;

  CustomDropdownFormField({
    required this.items,
    required this.onChanged,
    required this.selectedValue,
  });

  String toTitleCase(String input) {
    return input[0].toUpperCase() + input.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<String>(
      value: toTitleCase(selectedValue ?? 'male'),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      isExpanded: true,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 16),
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
        selectedValue = value.toString();
        onChanged(value.toString());
      },
      onSaved: (value) {
        selectedValue = value.toString();
      },
      buttonStyleData: const ButtonStyleData(
        padding: EdgeInsets.only(right: 8),
      ),
      iconStyleData: const IconStyleData(
        icon: Icon(
          Icons.keyboard_arrow_down,
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
