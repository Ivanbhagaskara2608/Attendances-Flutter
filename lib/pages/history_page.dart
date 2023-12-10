import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/history.dart';
import 'package:flutter_application_1/widgets/app_bar.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
import 'package:flutter_application_1/widgets/history_card.dart';
import 'package:flutter_application_1/widgets/history_modalbottom.dart';

class HistoryPage extends StatelessWidget {
  void _showFilterOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return HistoryModalBottom();
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

          return HistoryCard(
            historiesData.subject,
            historiesData.attendance,
            historiesData.status,
            historiesData.date,
            historiesData.time,
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _showFilterOptions(context);
        },
        backgroundColor: Color.fromARGB(255, 44, 62, 80),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        icon: Icon(
          Icons.filter_alt,
          color: Colors.white,
        ),
        label: Text(
          "Filter",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
