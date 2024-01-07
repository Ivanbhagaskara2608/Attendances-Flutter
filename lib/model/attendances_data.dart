class AttendanceData {
  final String month;
  final num presence;
  final num leave;
  final num sick;
  final num alpha;

  AttendanceData(this.month, this.presence, this.leave, this.sick, this.alpha);
}

List<AttendanceData> chartData = [
  AttendanceData("Jan", 50, 15, 4, 1),
  AttendanceData("Feb", 29, 23, 4, 2),
  AttendanceData("Mar", 30, 19, 2, 5),
  AttendanceData("Apr", 60, 3, 10, 4),
  AttendanceData("May", 45, 20, 9, 5),
  AttendanceData("Jun", 30, 15, 6, 7),
  AttendanceData("Jul", 28, 5, 20, 6),
  AttendanceData("Aug", 55, 0, 0, 7),
  AttendanceData("Sep", 38, 4, 6, 2),
  AttendanceData("Oct", 66, 2, 4, 5),
  AttendanceData("Nov", 46, 7, 1, 5),
  AttendanceData("Des", 60, 12, 3, 5),
];
