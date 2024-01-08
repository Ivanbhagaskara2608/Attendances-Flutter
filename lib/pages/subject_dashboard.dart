import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/attendance.dart';
import 'package:flutter_application_1/model/attendances_data.dart';
import 'package:flutter_application_1/model/subject.dart';
import 'package:flutter_application_1/widgets/attendance_card.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SubjectDashboard extends StatelessWidget {
  final Subject currentSubject;

  SubjectDashboard(this.currentSubject);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15, right: 15, left: 15),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 117,
            margin: EdgeInsets.only(bottom: 22),
            child: Material(
              borderRadius: BorderRadius.circular(15),
              color: Color.fromARGB(255, 44, 62, 80),
              child: InkWell(
                onTap: () {},
                splashColor: Colors.grey,
                borderRadius: BorderRadius.circular(15),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        currentSubject.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        currentSubject.description,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          if (currentSubject.type == "created")
            Container(
              width: double.infinity,
              height: 165,
              margin: EdgeInsets.only(bottom: 22),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey)),
              child: SfCartesianChart(
                legend:
                    Legend(isVisible: true, position: LegendPosition.bottom),
                tooltipBehavior: TooltipBehavior(enable: true),
                series: [
                  StackedColumnSeries<AttendanceData, String>(
                      dataSource: chartData,
                      xValueMapper: (AttendanceData data, _) => data.month,
                      yValueMapper: (AttendanceData data, _) => data.presence,
                      name: "Presence",
                      animationDuration: 1000),
                  StackedColumnSeries<AttendanceData, String>(
                      dataSource: chartData,
                      xValueMapper: (AttendanceData data, _) => data.month,
                      yValueMapper: (AttendanceData data, _) => data.leave,
                      name: "Leave",
                      animationDuration: 1000),
                  StackedColumnSeries<AttendanceData, String>(
                      dataSource: chartData,
                      xValueMapper: (AttendanceData data, _) => data.month,
                      yValueMapper: (AttendanceData data, _) => data.sick,
                      name: "Sick",
                      animationDuration: 1000),
                  StackedColumnSeries<AttendanceData, String>(
                      dataSource: chartData,
                      xValueMapper: (AttendanceData data, _) => data.month,
                      yValueMapper: (AttendanceData data, _) => data.alpha,
                      name: "Alpha",
                      animationDuration: 1000),
                ],
                primaryXAxis: CategoryAxis(labelStyle: TextStyle(fontSize: 8)),
              ),
            ),
          Expanded(
            child: ListView.builder(
              itemCount: attendances.length,
              itemBuilder: (context, index) {
                Attendance attendance = attendances[index];

                return AttendanceCard(attendance, currentSubject);
              },
            ),
          ),
        ],
      ),
    );
  }
}
