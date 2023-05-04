import 'package:app/models/token.dart';

class Profile {
  bool? _isLogged;
  String? _loggedUserId;
  String? _loggedUserName;
  Token? _token;

  @override
  String toString() {
    return "{'isLogged': $_isLogged, 'loggedUserId': $_loggedUserId, 'loggedUserName': $_loggedUserName, ${_token.toString()}}";
  }

  void setIsLogged({saveToDisk = true}) {

  }

}
