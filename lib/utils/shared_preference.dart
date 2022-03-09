import 'package:auth_test/model/user_model.dart';
import 'package:auth_test/model/token_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
class UserPreferences {
  Future<void> saveUser(User user) async {
    final userPrefs = await SharedPreferences.getInstance();

    userPrefs.setInt("userId", user.userId);
    userPrefs.setString("name", user.name);
    userPrefs.setString("email", user.email);
    userPrefs.setString("phone", user.phone);
    userPrefs.setString("token", user.token);
    userPrefs.setString("renewalToken", user.renewalToken);
  }

  Future<User> getUser() async {
    final userPrefs = await SharedPreferences.getInstance();

    int userId = userPrefs.getInt("userId");
    String name = userPrefs.getString("name");
    String email = userPrefs.getString("email");
    String phone = userPrefs.getString("phone");
    String token = userPrefs.getString("token");
    String renewalToken = userPrefs.getString("renewalToken");

    return User(
      userId: userId,
      name: name,
      email: email,
      phone: phone,
      token: token,
      renewalToken: renewalToken
    );
  }

  void removeUser() async {
    final userPrefs = await SharedPreferences.getInstance();

    userPrefs.remove("name");
    userPrefs.remove("email");
    userPrefs.remove("phone");
    userPrefs.remove("token");
  }

  // Future<String> getToken(args) async {
  //   final SharedPreferences userPrefs = await SharedPreferences.getInstance();
  //   String token = userPrefs.getString("token");
  //   return token;
  // }

  Future<void> saveToken(Token token) async {
    final tokenPrefs = await SharedPreferences.getInstance();
    tokenPrefs.setString("token", token.token);
    // userPrefs.setString("renewalToken", user.renewalToken);
  }

  Future<Token> getToken() async {
    final tokenPrefs = await SharedPreferences.getInstance();

    String token = tokenPrefs.getString("token");

    return Token(
      token: token,
    );
  }

  void removeToken() async {
    final tokenPrefs = await SharedPreferences.getInstance();

    tokenPrefs.remove("token");
  }
} 