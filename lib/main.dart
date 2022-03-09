import 'package:auth_test/providers/token_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:auth_test/model/token_model.dart';
import 'package:auth_test/providers/auth_provider.dart';
import 'package:auth_test/providers/user_provider.dart';
import 'package:auth_test/screens/home_screen.dart';
import 'package:auth_test/screens/login_screen.dart';
import 'package:auth_test/screens/registration_screen.dart';
import 'package:auth_test/screens/splash_screen.dart';
import 'package:auth_test/utils/shared_preference.dart';

// import 'model/user_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    Future<Token> getTokenData() => UserPreferences().getToken();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => TokenProvider()),
      ],
      child: MaterialApp(
          title: 'Auth Test Demo',
          theme: ThemeData(
            primarySwatch: Colors.green,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: FutureBuilder(
              future: getTokenData(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:{

                    print(snapshot.data);
                  }
                  break;
                  case ConnectionState.waiting:{
                    print(snapshot.data);
                    return CircularProgressIndicator();
                  }
                  break;
                  default:
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (snapshot.data.token == null) {
                      return SplashScreen();
                    }else if(snapshot.data.token != null){
                      print({'Hello testing token', snapshot.data.token});
                      return HomeScreen();
                    }else {
                      UserPreferences().removeToken();
                    }
                    return SplashScreen(token: snapshot.data);
                }
              }),
          routes: {
            '/splash_screen': (context) =>  SplashScreen(),
            '/home_screen': (context) => HomeScreen(),
            '/login': (context) => LoginScreen(),
            '/register': (context) => RegistrationScreen(),
          }),
    );
  }
}

