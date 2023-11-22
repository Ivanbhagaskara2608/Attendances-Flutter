class Subject {
  final String title;
  final String createdBy;
  final int totalMembers;

  Subject(this.title, this.createdBy, this.totalMembers);
}

List createdSubjects = [
  Subject("KSPM XI", "John Doe", 100),
  Subject("Himatika", "John Doe", 100),
  Subject("Robotika", "John Doe", 100),
  Subject("KSPM XI", "John Doe", 100),
  Subject("Himatika", "John Doe", 100),
  Subject("Robotika", "John Doe", 100),
];

List joinedSubjects = [
  Subject("KSPM XX", "John Doe", 100),
  Subject("Himakom", "John Doe", 100),
  Subject("Informatika", "John Doe", 100),
  Subject("KSPM XX", "John Doe", 100),
  Subject("Himakom", "John Doe", 100),
  Subject("Informatika", "John Doe", 100),
];
