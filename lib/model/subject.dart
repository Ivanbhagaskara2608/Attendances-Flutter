class Subject {
  final String title;
  final String createdBy;
  final String description;
  final String code;
  final int totalMembers;
  final String type;

  Subject(this.title, this.createdBy, this.description, this.code, this.totalMembers, this.type);
}

List subjects = [
  Subject("KSPM XI", "John Doe", "Lorem ipsum dolor sit amet", "186f0a", 100, "created"),
  Subject("Himatika", "John Doe", "Lorem ipsum dolor sit amet", "186f0a", 100, "created"),
  Subject("Robotika", "John Doe", "Lorem ipsum dolor sit amet", "186f0a", 100, "created"),
  Subject("Akrap", "John Doe", "Lorem ipsum dolor sit amet", "186f0a", 100, "joined"),
  Subject("Himasi", "John Doe", "Lorem ipsum dolor sit amet", "186f0a", 100, "joined"),
  Subject("Akuntansi", "John Doe", "Lorem ipsum dolor sit amet", "186f0a", 100, "joined"),
];
