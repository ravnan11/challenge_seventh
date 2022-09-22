import 'package:login_seventh/app/core/data/http/http.dart';

abstract class HomeRepository {
  Future<dynamic> getVideo({required String token});
}

class HomeRepositoryImp implements HomeRepository {
  final HttpClient httpClient;
  HomeRepositoryImp(this.httpClient);

  @override
  Future getVideo({required String token}) async {
    try {
      print('valor do token');
      print(token);
      final httpResponse = await httpClient.request(
        'http://mobiletest.seventh.com.br/video/bunny.mp4',
        method: 'get',
        headers: {'X-Access-Token': token},
      );

      return httpResponse;
    } catch (e) {
      return e;
    }
  }
}
