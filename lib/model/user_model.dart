class User {
  int id;
  String name;
  String email;
  String phone;

  User({this.id, this.name, this.email, this.phone,});

  factory User.fromJson(Map<String, dynamic> responseData) {
    return User(
        id: responseData['id'],
        name: responseData['name'],
        email: responseData['email'],
        phone: responseData['phone'],
    );
  }
}