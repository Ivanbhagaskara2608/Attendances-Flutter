import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/status_radio.dart';
import 'package:flutter_application_1/widgets/calendar_textfield.dart';
import 'package:flutter_application_1/widgets/status_radiobutton.dart';
import 'package:flutter_application_1/widgets/textfield_custom.dart';

class HistoryModalBottom extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _HistoryModalBottomState createState() => _HistoryModalBottomState();
}

class _HistoryModalBottomState extends State<HistoryModalBottom> {
  TextEditingController subjectController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  List<StatusRadio> radioItems = [];

  @override
  void initState() {
    super.initState();
    _initRadioItems();
  }

  void _initRadioItems() {
    radioItems.add(StatusRadio(false, "P"));
    radioItems.add(StatusRadio(false, "L"));
    radioItems.add(StatusRadio(false, "S"));
    radioItems.add(StatusRadio(false, "A"));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 12),
            width: 50,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Center(
                  child: Text(
                    "Filter",
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 44, 62, 80),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 8),
                  child: Row(
                    children: [
                      Text("Subject", style: TextStyle(fontSize: 18)),
                    ],
                  ),
                ),
                CustomTextFIeld(
                    hintName: "Subject",
                    isRequired: false,
                    isEmail: false,
                    minLength: 0,
                    maxLength: null,
                    controller: subjectController),
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 8),
                  child: Row(
                    children: [
                      Text("Date Range", style: TextStyle(fontSize: 18)),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                        child: CalendarTextField(
                            hintName: "Start",
                            isRequired: false,
                            isBirthdate: false,
                            controller: startDateController)),
                    SizedBox(width: 20),
                    Expanded(
                        child: CalendarTextField(
                      hintName: "End",
                      isRequired: false,
                      isBirthdate: false,
                      controller: endDateController,
                    )),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 10),
                  child: Row(
                    children: [
                      Text("Status", style: TextStyle(fontSize: 18)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40, // Sesuaikan tinggi sesuai kebutuhan
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: radioItems.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            for (var element in radioItems) {
                              element.isSelected = false;
                            }
                            radioItems[index].isSelected = true;
                          });
                        },
                        child: StatusIndicator(radioItems[index]),
                      );
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 5),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 190, 0, 57),
                        minimumSize: Size.fromHeight(35),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                    child: Text(
                      "Reset All Filter",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 44, 62, 80),
                      minimumSize: Size.fromHeight(35),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                  child: Text(
                    "Save",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
