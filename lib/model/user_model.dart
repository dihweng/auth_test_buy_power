class User {
  int userId;
  String name;
  String email;
  String phone;
  String token;
  String renewalToken;

  User({this.userId, this.name, this.email, this.phone, this.token, this.renewalToken});

  factory User.fromJson(Map<String, dynamic> responseData) {
    return User(
        userId: responseData['id'],
        name: responseData['name'],
        email: responseData['email'],
        phone: responseData['phone'],
        token: responseData['access_token'],
        renewalToken: responseData['renewal_token']
    );
  }
}