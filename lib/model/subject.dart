class Subject {
  final String title;
  final String createdBy;
  final int totalMembers;
  final String type;

  Subject(this.title, this.createdBy, this.totalMembers, this.type);
}

List subjects = [
  Subject("KSPM XI", "John Doe", 100, "created"),
  Subject("Himatika", "John Doe", 100, "created"),
  Subject("Robotika", "John Doe", 100, "created"),
  Subject("Akrap", "John Doe", 100, "joined"),
  Subject("Himasi", "John Doe", 100, "joined"),
  Subject("Akuntansi", "John Doe", 100, "joined"),
];
