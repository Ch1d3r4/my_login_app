class User {
  int id;
  String firstName;
  String lastName;
  String email;
  String password;

  User(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.password});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'password': password,
    };
  }
}
