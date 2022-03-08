// ignore_for_file: prefer_const_constructors

import 'package:auth_test/providers/auth_provider.dart';
import 'package:auth_test/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:auth_test/model/user_model.dart';
import 'package:auth_test/providers/user_provider.dart';
import 'package:provider/provider.dart';
// import 'package:auth_test/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  // form key
  final _formkey = GlobalKey<FormState>();

  // text input editing controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
  
    AuthProvider auth = Provider.of<AuthProvider>(context);

    var loading  = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
      CircularProgressIndicator(),
      Text(" Registering ... Please wait")
      ],
    );
    
    void onLogin (String email, String password)async{

      final Future<Map<String,dynamic>> respose =  auth.login(email, password);

      respose.then((response) {
        if (response['status']) {

          User user = response['user'];

          Provider.of<UserProvider>(context, listen: false).setUser(user);

          // Navigator.pushReplacementNamed(context, HomeScreen());
          auth.loggedInStatus = Status.LoggedIn;
          auth.notify();

        } else {
          Fluttertoast.showToast(msg: response['message']['message'].toString());
        }
      });
    }
    // email input field
    final emailField  = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value.isEmpty) {
          return ("Please Enter Your Email");
        }
        // reg expression for email validation
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
            .hasMatch(value)) {
          return ("Please Enter a valid email");
        }
        return null;
      },      
      onSaved: (value){
        emailController.text = value;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.mail),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Email',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
        )
      ),
    );

    // password input field
    final passwordField  = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: true,
      validator: (value) {
        RegExp regex = RegExp(r'^.{6,}$');
        if (value.isEmpty) {
          return ("Password is required for login");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid Password(Min. 6 Character)");
        }
      },
      onSaved: (value)
      {
        passwordController.text = value;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Password',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
        )
      ),
    );

    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(8),
      color: Colors.lightGreen[800],
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          onLogin(emailController.text, passwordController.text);
        },
        child: Text(
          "Login",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)
        )
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 150,
                      width: 150,
                      child: Image.asset(
                        "assets/logo.png",
                        fit: BoxFit.contain)),
                    emailField,
                    SizedBox(height: 15),

                    passwordField,
                    SizedBox(height: 25),
                    auth.loggedInStatus == Status.Authenticating
                    ?loading
                      : loginButton,
                      SizedBox(height: 15),       
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Don't have an account?"),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                    RegistrationScreen()));
                          },
                          child: Text(
                            "SignUp",
                            style: TextStyle(
                              color: Colors.lightGreen[700],
                              fontWeight: FontWeight.bold,
                              fontSize: 15
                            )
                          )
                        )
                      ]
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}