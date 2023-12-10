import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/status_radio.dart';

class StatusIndicator extends StatelessWidget {
  final StatusRadio _item;

  StatusIndicator(this._item);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: CircleAvatar(
        maxRadius: 20,
        backgroundColor: _item.isSelected
            ? Color.fromARGB(255, 66, 66, 66)
            : Colors.transparent,
        child: CircleAvatar(
          backgroundColor: _getStatusColor(),
          maxRadius: 18,
          child: Text(
            _item.buttonText,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: _getStatusTextColor(),
            ),
          ),
        ),
      ),
    );
  }

  Color _getStatusColor() {
    switch (_item.buttonText) {
      case "P":
        return Color.fromARGB(255, 158, 255, 150);
      case "L":
        return Color.fromARGB(255, 225, 220, 108);
      case "S":
        return Color.fromARGB(255, 204, 204, 204);
      case "A":
        return Color.fromARGB(255, 255, 177, 199);
      default:
        return Colors.grey;
    }
  }

  Color _getStatusTextColor() {
    switch (_item.buttonText) {
      case "P":
        return Color.fromARGB(255, 15, 175, 1);
      case "L":
        return Color.fromARGB(255, 175, 134, 1);
      case "S":
        return Color.fromARGB(255, 66, 66, 66);
      case "A":
        return Color.fromARGB(255, 190, 0, 57);
      default:
        return Colors.white;
    }
  }
}
