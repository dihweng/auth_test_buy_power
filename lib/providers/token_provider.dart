import 'package:flutter/cupertino.dart';
import 'package:auth_test/model/token_model.dart';

class TokenProvider extends ChangeNotifier{

  Token _token = Token();

  Token get token => _token;

  void setToken (Token token){
    _token = token;
    notifyListeners();
  }
}