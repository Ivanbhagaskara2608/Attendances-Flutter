class User {
  final String id;
  final String email;
  final String fullname;
  final String gender;
  final String birthdate;
  final String emailVerifiedAt;
  final String type;
  final String level;
  final int totalCreatedSubject;
  final String image;
  final String createdAt;

  User({
    required this.id,
    required this.email,
    required this.fullname,
    required this.gender,
    required this.birthdate,
    required this.emailVerifiedAt,
    required this.type,
    required this.level,
    required this.totalCreatedSubject,
    required this.image,
    required this.createdAt,
  });
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? '',
      email: json['email'] ?? '',
      fullname: json['full_name'] ?? '',
      gender: json['gender'] ?? '',
      birthdate: json['birthdate'] ?? '',
      emailVerifiedAt: json['email_verified_at'] ?? '',
      type: json['type'] ?? '',
      level: json['level'] ?? '',
      totalCreatedSubject: json['total_created_subject'] ?? 0,
      image: json['image'] ?? '',
      createdAt: json['created_at'] ?? '',
    );
  }
}

// final userData = User(
//     id: "1",
//     email: "ivanbhagas2003@gmail.com",
//     fullname: "Ivan Bhagaskara",
//     gender: "Male",
//     birthdate: "26-08-2003",
//     emailVerifiedAt: "null", 
//     type: "Free",
//     level: "user", 
//     totalCreatedSubject: 1,
//     image: "path_to_image",
//     createdAt: "26-08-2023"
//   );