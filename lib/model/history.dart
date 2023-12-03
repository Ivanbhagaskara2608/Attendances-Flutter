class History {
  final String subject;
  final String attendance;
  final String status;
  final String date;
  final String time;

  History(this.subject, this.attendance, this.status, this.date, this.time);
}

List histories = [
  History("KSPM XI", "Absen 1", "P", "24 November 2023", "19:00"),
  History("Himatika", "Absen 1", "L", "24 November 2023", "19:00"),
  History("Robotika", "Absen 1", "S", "24 November 2023", "19:00"),
  History("Robotika", "Absen 1", "A", "24 November 2023", "19:00"),
];
