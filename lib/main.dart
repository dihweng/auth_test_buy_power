import 'package:auth_test/providers/auth_provider.dart';
import 'package:auth_test/providers/user_provider.dart';
import 'package:auth_test/screens/home_screen.dart';
import 'package:auth_test/screens/login_screen.dart';
import 'package:auth_test/screens/registration_screen.dart';
import 'package:auth_test/screens/splash_screen.dart';
import 'package:auth_test/utils/shared_preference.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/user_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    Future<User> getUserData() => UserPreferences().getUser();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: FutureBuilder(
              future: getUserData(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return CircularProgressIndicator();
                  default:
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (snapshot.data.token == null) {
                      return LoginScreen();
                    } else {
                      UserPreferences().removeUser();
                    }
                    return SplashScreen(user: snapshot.data);
                }
              }),
          routes: {
            '/home_screen': (context) => HomeScreen(),
            '/login': (context) => LoginScreen(),
            '/register': (context) => RegistrationScreen(),
          }),
    );
  }
}

