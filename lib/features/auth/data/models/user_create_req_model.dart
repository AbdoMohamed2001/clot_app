class UserCreateReqModel {
  final String firstName, lastName, email, password;
  String? age;
  String? gender;

  UserCreateReqModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    this.gender,
    this.age,
  });

  Map<String, dynamic> toJson() {
    return {
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "password": password,
      "age": age,
      "gender": gender,
    };
  }
}
