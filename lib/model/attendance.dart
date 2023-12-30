class Attendance {
  final String title;
  final String createdAt;
  final String createdBy;
  final String status;
  final String startTime;
  final String endTime;

  Attendance(this.title, this.createdAt, this.createdBy, this.status, this.startTime, this.endTime);
}

List attendances = [
  Attendance("Rapat MUBES 2", "1 September 2023", "John Doe","P", "19:00", "19:30"),
  Attendance("Rapat MUBES 3", "1 Oktober 2023","John Doe","L", "19:00", "19:30"),
  Attendance("Rapat MUBES 4", "1 November 2023", "John Doe","S", "19:00", "19:30"),
  Attendance("Rapat MUBES 5", "1 Desember 2023", "John Doe","A", "19:00", "19:30"),
  Attendance("Rapat MUBES 6", "1 September 2023", "John Doe","P", "19:00", "19:30"),
  Attendance("Rapat MUBES 7", "1 Oktober 2023", "John Doe","L", "19:00", "19:30"),
  Attendance("Rapat MUBES 8", "1 November 2023", "John Doe","S", "19:00", "19:30"),
  Attendance("Rapat MUBES 9", "1 Desember 2023", "John Doe","A", "19:00", "19:30"),
];
