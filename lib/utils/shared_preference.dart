import 'package:auth_test/model/user_model.dart';
import 'package:auth_test/model/token_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
class UserPreferences {
  Future<void> saveUser(User user) async {
    final userPref = await SharedPreferences.getInstance();

    userPref.setInt("id", user.id);
    userPref.setString("name", user.name);
    userPref.setString("email", user.email);
    userPref.setString("phone", user.phone);
    // userPrefs.setString("token", user.token);
    // userPrefs.setString("renewalToken", user.renewalToken);
  }

  Future<User> getUser() async {
    final userPref = await SharedPreferences.getInstance();

    int id = userPref.getInt("id");
    String name = userPref.getString("name");
    String email = userPref.getString("email");
    String phone = userPref.getString("phone");
    // String token = userPrefs.getString("token");
    // String renewalToken = userPrefs.getString("renewalToken");

    return User(
      id: id,
      name: name,
      email: email,
      phone: phone,
      // token: token,
      // renewalToken: renewalToken
    );
  }

  void removeUser() async {
    final userPref = await SharedPreferences.getInstance();

    userPref.remove("name");
    userPref.remove("email");
    userPref.remove("phone");
    // userPrefs.remove("token");
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