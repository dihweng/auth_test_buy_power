import 'package:flutter/material.dart';
import 'package:auth_test/model/user_model.dart';
import 'package:auth_test/providers/user_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  final User user;

  const SplashScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<UserProvider>(context).setUser(user);

    return Scaffold(
      body: Container(
        child: Center(
          child: Text("WELCOME PAGE"),
        ),
      ),
    );
  }
}