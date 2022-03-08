// ignore_for_file: constant_identifier_names

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:auth_test/model/user_model.dart';
import 'package:auth_test/utils/app_url.dart';
import 'package:auth_test/utils/shared_preference.dart';
import 'package:http/http.dart';

enum Status {
  NotLoggedIn,
  NotRegistered,
  LoggedIn,
  Registered,
  Authenticating,
  Registering,
  LoggedOut
}

class AuthProvider extends ChangeNotifier {
  Status _loggedInStatus = Status.NotLoggedIn;
  Status _registeredInStatus = Status.NotRegistered;

  Status get loggedInStatus => _loggedInStatus;
  Status get registeredInStatus => _registeredInStatus;

  set loggedInStatus(Status value) {
    _loggedInStatus = value;
  }

  set registeredInStatus(Status value) {
    _registeredInStatus = value;
  }

  Future<Map<String, dynamic>> login(String email, String password) async {

    var result;

    final Map<String, dynamic> loginData = {
      'user' : {
        'email': email,
        'Password': password
      }
    };

    _loggedInStatus = Status.Authenticating;
    notifyListeners();

    Response response = await post(
      Uri.parse(AppUrl.login),
      body: json.encode(loginData),
      headers: {'Content-Type': 'application/json',},
    );

    if (response.statusCode == 200) {

      final Map<String, dynamic> responseData = json.decode(response.body);

      var userData = responseData['data'];

      User authUser = User.fromJson(userData);
      print(authUser);

      UserPreferences().saveUser(authUser);

      _loggedInStatus = Status.LoggedIn;
      notifyListeners();

      result = {'status': true, 'message': 'Successful', 'user': authUser};

    } else {
      _loggedInStatus = Status.NotLoggedIn;
      notifyListeners();
      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };
    }

    return result;

  }

  static Future<FutureOr> register(String email, 
    String firstName, String secondName, String password) async {

    final Map<String, dynamic> registrationData = {
      'user':{
        'firstName': firstName,
        'lastName': secondName,
        'email': email,
        'password': password
      }
    };

    // _registeredInStatus = Status.Registering;
    // notifyListeners();

    return await post(
      Uri.parse(AppUrl.register),
      body: json.encode(registrationData),
      headers: {'Content-Type':'application/json'}
    ).then(onValue)
    .catchError(onError);
  }

  notify(){
    notifyListeners();
  }

  static Future<FutureOr> onValue (Response response) async {
    var result;

    final Map<String, dynamic> responseData = json.decode(response.body);

    print(responseData);

    if(response.statusCode == 200){

      var userData = responseData['data'];

      // create a user model
      User authUser = User.fromJson(userData);

      // create shared preferences and save data
      UserPreferences().saveUser(authUser);

      result = {
        'status':true,
        'message':'Successfully registered',
        'data':authUser
      };

    }else{
      result = {
        'status':false,
        'message':'Successfully registered',
        'data':responseData
      };
    }
    return result;
  }

  static onError(error){
    // print('the error is ${error.detail}');
    return {
      'status':false,
      'message':'Unsuccessful Request',
      'data':error
    };
  }
}