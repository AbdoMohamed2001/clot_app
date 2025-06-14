class UserCreateReqModel {
  final String firstName, lastName, email, password;
  String? age;
  int? gender;

  UserCreateReqModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    this.gender,
    this.age,
  });
}
