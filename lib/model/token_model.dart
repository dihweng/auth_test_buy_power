class Token {
  String token;
  // String renewalToken

  Token({ 
    this.token, 
    // this.renewalToken
    });

  factory Token.fromJson(Map<String, dynamic> responseData) {
    return Token(
        token: responseData['access_token'],
        // renewalToken: responseData['renewal_token']
    );
  }
}