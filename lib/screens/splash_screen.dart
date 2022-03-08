import 'package:auth_test/screens/login_screen.dart';
import 'package:auth_test/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:auth_test/model/user_model.dart';
import 'package:auth_test/providers/user_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  final User user;

  const SplashScreen({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<UserProvider>(context).setUser(user);

    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(8),
      color: Colors.white,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20,15,20,15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: (){
          //navigate to login
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                LoginScreen()));
        },
        child: Text(
          "Login",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20, color: Colors.lightGreen[700], fontWeight: FontWeight.bold
            ),
        ),
      ),
    );

    final signupButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(8),
      color: Colors.lightGreen[700],
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20,15,20,15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: (){
          //navigate to signup
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                RegistrationScreen()));
        },
        child: Text(
          "SignUp",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold
            ),
        ),
      ),
    );


    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(padding: EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 150,
                  width: 150,
                  child: Image.asset(
                    "assets/logo.png",
                    fit: BoxFit.contain)
                ),
                SizedBox(height: 15),
                Text(
                  "Welcome to Buy Power",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15
                  )
                ),
                SizedBox(height: 20),
                loginButton,
                SizedBox(height: 20),
                signupButton,
              ],
            ),
          ),
        ),
      ),
    );
  }
}