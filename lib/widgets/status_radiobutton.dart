import 'package:flutter/material.dart';

class StatusIndicator extends StatefulWidget {
  final String status;

  StatusIndicator(this.status);

  @override
  // ignore: library_private_types_in_public_api
  _StatusIndicatorState createState() => _StatusIndicatorState();
}

class _StatusIndicatorState extends State<StatusIndicator> {
  String selectedStatus = "";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedStatus = widget.status;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: CircleAvatar(
          maxRadius: 20,
          backgroundColor: (selectedStatus == widget.status)
              ? Color.fromARGB(255, 44, 62, 80)
              : Colors.transparent,
          child: CircleAvatar(
            backgroundColor: _getStatusColor(),
            maxRadius: 18,
            child: Text(
              widget.status,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: _getStatusTextColor(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color _getStatusColor() {
    switch (widget.status) {
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
    switch (widget.status) {
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
