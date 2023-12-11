import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/status_radio.dart';

class CameraZoomIndicator extends StatelessWidget {
  final StatusRadio _item;

  CameraZoomIndicator(this._item);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: CircleAvatar(
        maxRadius: _item.isSelected ? 20 : 5,
        backgroundColor:
            _item.isSelected ? Colors.black.withOpacity(0.5) : Colors.white,
        child: _item.isSelected
            ? CircleAvatar(
                backgroundColor: Colors.transparent,
                maxRadius: 18,
                child: Text(
                  _item.buttonText,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              )
            : null,
      ),
    );
  }
}
