import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/attendance.dart';
import 'package:flutter_application_1/model/subject_member.dart';
import 'package:flutter_application_1/widgets/dropdown_status.dart';
import 'package:flutter_application_1/widgets/member_statistic_card.dart';

import '../widgets/indicator.dart';

// ignore: must_be_immutable
class StatisticAttendancePage extends StatefulWidget {
  final Attendance attendance;

  StatisticAttendancePage(this.attendance, {super.key});

  @override
  State<StatisticAttendancePage> createState() => _StatisticAttendancePageState();
}

class _StatisticAttendancePageState extends State<StatisticAttendancePage> {
  final List<String> statusItems = ['Presence', 'Leave', 'Sick', 'Alpha'];

  String? selectedValue;
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Statistic Attendance",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 44, 62, 80)),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: const Color.fromARGB(255, 44, 62, 80)),
        elevation: 1,
      ),
      body: ListView(padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20), children: [
        Center(
          child: Text(
            widget.attendance.title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Color.fromARGB(255, 44, 62, 80)),
          ),
        ),
        Container(
            height: 200,
            margin: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(15),
                color: Colors.white),
            child: Row(
              children: [
                Expanded(child: PieChart(PieChartData(pieTouchData: PieTouchData(touchCallback: (FlTouchEvent event, pieTouchResponse) {
                  setState(() {
                    if (!event.isInterestedForInteractions ||
                        pieTouchResponse == null ||
                        pieTouchResponse.touchedSection == null) {
                      touchedIndex = -1;
                      return;
                    }
                    touchedIndex = pieTouchResponse
                        .touchedSection!.touchedSectionIndex;
                  });
                },), startDegreeOffset: 180,
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 1,
                  centerSpaceRadius: 0,
                  sections: showingSections(),)),
                ),
                Column(mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start, children: [Indicator(
                    color: Color(0xff0293ee),
                    text: 'Presence',
                    isSquare: true,
                  ),Indicator(
                    color: Color(0xfff8b250),
                    text: 'Alpha',
                    isSquare: true,
                  ),],)
                ],
            )),
        Row(
          children: [
            Expanded(
              child: Text(
                "List Attendance User",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color.fromARGB(255, 44, 62, 80)),
              ),
            ),
            SizedBox(
                width: 110,
                height: 30,
                child: DropDownStatus(statusItems, selectedValue))
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          padding: EdgeInsets.all(10),
          height: 400,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(15)),
          child: ListView.builder(
            itemCount: subjectMembers.length,
            itemBuilder: (context, index) {
              SubjectMember member = subjectMembers[index];

              return StatisticMemberCard(member);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 15, 175, 1),
                minimumSize: Size.fromHeight(35),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0))),
            child: Text(
              "Export to CSV",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.white),
            ),
          ),
        ),
      ]),
    );
  }
  List<PieChartSectionData> showingSections() {
    const presence = 3;
    const leave = 2;
    const sick = 1;
    const alpha = 3;
    return List.generate(4, (i) {
        final isTouched = i == touchedIndex;
        const color0 = Color(0xff0293ee);
        const color1 = Color(0xFF2ECC71);
        const color2 = Color(0xFF9B4DA6);
        const color3 = Color(0xfff8b250);

        switch (i) {
          case 0:
            return PieChartSectionData(
              color: color0,
              value: presence.toDouble(),
              title: presence.toString(),
              titleStyle: TextStyle(fontSize: 12),
              radius: 50 + (presence.toDouble() * 10).clamp(0, 100),
              titlePositionPercentageOffset: 0.55,
              borderSide: isTouched
                  ? const BorderSide(
                  color: Colors.grey, width: 4)
                  : BorderSide(
                  color: Colors.grey.withOpacity(0)),
            );
          case 1:
            return PieChartSectionData(
              color: color1,
              value: leave.toDouble(),
              title: leave.toString(),
              titleStyle: TextStyle(fontSize: 12),
              radius: 50 + (leave.toDouble() * 10).clamp(0, 100),
              titlePositionPercentageOffset: 0.55,
              borderSide: isTouched
                  ? const BorderSide(
                  color: Colors.grey, width: 4)
                  : BorderSide(
                  color: Colors.grey.withOpacity(0)),
            );
          case 2:
            return PieChartSectionData(
              color: color2,
              value: sick.toDouble(),
              title: sick.toString(),
              titleStyle: TextStyle(fontSize: 12),
              radius: 50 + (sick.toDouble() * 10).clamp(0, 100),
              titlePositionPercentageOffset: 0.6,
              borderSide: isTouched
                  ? const BorderSide(
                  color: Colors.grey, width: 4)
                  : BorderSide(
                  color: Colors.grey.withOpacity(0)),
            );
          case 3:
            return PieChartSectionData(
              color: color3,
              value: alpha.toDouble(),
              title: alpha.toString(),
              titleStyle: TextStyle(fontSize: 12),
              radius: 50 + (alpha.toDouble() * 10).clamp(0, 100),
              titlePositionPercentageOffset: 0.55,
              borderSide: isTouched
                  ? const BorderSide(
                  color: Colors.grey, width: 4)
                  : BorderSide(
                  color: Colors.grey.withOpacity(0)),
            );
          default:
            throw Error();
        }
      },
    );
  }
}
