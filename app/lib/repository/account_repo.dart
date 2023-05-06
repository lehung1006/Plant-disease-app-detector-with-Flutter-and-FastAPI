import 'package:app/models/token.dart';
import 'package:app/network/api_services.dart';
import 'package:app/network/dio_exception.dart';
import 'package:dio/dio.dart';

abstract class AccountRepo {
  Future<Token> requestLogin(String email, String password);
}

class AccountRepoImpl extends AccountRepo {
  final ApiServices _apiServices;

  AccountRepoImpl(this._apiServices);

  @override
  Future<Token> requestLogin(String email, String password) async {
    try {
      final response = await _apiServices.requestLogin(email, password);
      var data = response.data["data"];
      return Token.fromJson(data);
    } on DioError catch (e) {
      throw DioExceptions.toException(e);
    }
  }
}
