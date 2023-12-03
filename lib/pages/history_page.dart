import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/history.dart';
import 'package:flutter_application_1/widgets/app_bar.dart';
import 'package:flutter_application_1/widgets/calendar_textfield.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
import 'package:flutter_application_1/widgets/history_card.dart';
import 'package:flutter_application_1/widgets/status_radiobutton.dart';
import 'package:flutter_application_1/widgets/textfield_custom.dart';

class HistoryPage extends StatelessWidget {
  void _showFilterOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Column(children: [
              Container(
                margin: EdgeInsets.only(bottom: 12),
                width: 50,
                height: 5,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20)),
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
                          color: Color.fromARGB(255, 44, 62, 80)),
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
                  CustomTextFIeld("Subject"),
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
                      Expanded(child: CalendarTextField("Start")),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(child: CalendarTextField("End"))
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
                  Row(
                    children: [
                      StatusIndicator("P"),
                      StatusIndicator("L"),
                      StatusIndicator("S"),
                      StatusIndicator("A")
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, bottom: 5),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 190, 0, 57),
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
              ))
            ]),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: ListView.builder(
        itemCount: histories.length,
        itemBuilder: (context, index) {
          History historiesData = histories[index];

          return HistoryCard(historiesData.subject, historiesData.attendance,
              historiesData.status, historiesData.date, historiesData.time);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            _showFilterOptions(context);
          },
          backgroundColor: Color.fromARGB(255, 44, 62, 80),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30))),
          icon: Icon(
            Icons.filter_alt,
            color: Colors.white,
          ),
          label: Text("Filter",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.white))),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
