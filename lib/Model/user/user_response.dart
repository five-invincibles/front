class UserResponse {
  final String email;
  final String kakaoID;
  final String name;
  final String university;

  UserResponse(
      {required this.email,
      required this.kakaoID,
      required this.name,
      required this.university});

  factory UserResponse.formJson(Map<String, dynamic> json) {
    return UserResponse(
        email: json['email'],
        kakaoID: json['kakaoID'],
        name: json['name'],
        university: json['university']);
  }
}
