import '../../core/data/http/http.dart';

abstract class LoginRepository {
  Future<dynamic> login({required String username, required String password});
}

class LoginRepositoryImp implements LoginRepository {
  final HttpClient httpClient;
  LoginRepositoryImp(this.httpClient);

  @override
  Future<dynamic> login(
      {required String username, required String password}) async {
    try {
      Map<String, dynamic> body = {
        "username": username,
        "password": password,
      };

      final httpResponse = await httpClient.request(
        'http://mobiletest.seventh.com.br/login',
        method: 'post',
        body: body,
      );

      return httpResponse;
    } catch (e) {
      return e;
    }
  }
}
