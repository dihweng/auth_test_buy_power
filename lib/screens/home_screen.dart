import 'package:flutter/material.dart';
// import 'package:oauth_dio/oauth_dio.dart';

import 'package:auth_test/model/token_model.dart';
import 'package:auth_test/screens/splash_screen.dart';
import 'package:auth_test/utils/shared_preference.dart';
import 'package:auth_test/providers/token_provider.dart';
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


  // OAuthToken token = oauth.requestToken(
  //   RefreshTokenGrant(
  //     refreshToken: '<YOUR REFRESH TOKEN>'
  //   )
  // ).then((token) {
  //     print(token.accessToken);
  // });
    Token token = Provider.of<TokenProvider>(context).token;
    // User user = Provider.of<UserProvider>(context).user;
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
          // Center(child: Text(user.email)),
          Center(child: Text('Welcome Back')),
          const SizedBox(height: 100),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.lightGreen[700], // background
              onPrimary: Colors.green, // foreground
            ),
            onPressed: () {doLogout();
            },
            child: Text(
              'Logout',
              ),
          )
        ],
      ),
    );
  }
}
