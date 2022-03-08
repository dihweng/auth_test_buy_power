import 'package:auth_test/providers/auth_provider.dart';
import 'package:auth_test/screens/splash_screen.dart';
import 'package:auth_test/utils/shared_preference.dart';
import 'package:flutter/material.dart';
import 'package:auth_test/model/user_model.dart';
import 'package:auth_test/providers/user_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
  // AuthProvider auth = Provider.of<AuthProvider>(context);


    User user = Provider.of<UserProvider>(context).user;
    void doLogout(){
      UserPreferences().removeUser();
      Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => SplashScreen()),
        (route) => false);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("DASHBOARD PAGE"),
        elevation: 0.1,
      ),
      body: Column(
        children: [
          const SizedBox(height: 100,),
          Center(child: Text(user.email)),
          const SizedBox(height: 100),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.lightGreen[700], // background
              onPrimary: Colors.green, // foreground
            ),
            onPressed: () {doLogout();
            },
            child: Text('Logout'),
          )
        ],
      ),
    );
  }
}
