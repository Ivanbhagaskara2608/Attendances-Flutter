class SubjectMember {
  final String fullname;
  final String email;
  final String joinDate;
  final String role;
  final String status;

  SubjectMember(this.fullname, this.email, this.joinDate, this.role, this.status);
}

List subjectMembers = [
  SubjectMember("Bagus", "bagus@gmail.com", "1 August 2023", "Member", "P"),
  SubjectMember("Agus", "agus@gmail.com", "1 August 2023", "Member", "P"),
  SubjectMember("Meimei", "bagus@gmail.com", "1 August 2023", "Moderator", "L"),
  SubjectMember("Jupri", "jupri@gmail.com", "1 August 2023", "Member", "S"),
  SubjectMember("Feri", "feri@gmail.com", "1 August 2023", "Member", "S"),
  SubjectMember("Melly", "melly@gmail.com", "1 August 2023", "Member", "A"),
  SubjectMember("Kurnia", "kurnia@gmail.com", "1 August 2023", "Moderator", "P"),
  SubjectMember("Sela", "sela@gmail.com", "1 August 2023", "Member", "A"),
  SubjectMember("Riski", "riski@gmail.com", "1 August 2023", "Moderator", "A"),
];
