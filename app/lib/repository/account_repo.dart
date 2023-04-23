import 'package:app/models/token.dart';
import 'package:app/network/api_services.dart';

abstract class AccountRepo {
  Future<Token> requestLogin(String email, String password);
}

class AccountRepoImpl extends AccountRepo {

  final ApiServices _apiServices;

  AccountRepoImpl(this._apiServices);

  @override
  Future<Token> requestLogin(String email, String password) async {
    final response = await _apiServices.requestLogin(email, password);
    var data = response.data["data"];
    return Token.fromJson(data);
  }
}