import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_seventh/app/core/data/http/http.dart';
import 'package:login_seventh/app/modules/login/login_controller.dart';
import 'package:login_seventh/app/modules/login/login_page.dart';
import 'package:login_seventh/app/modules/login/login_repository.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => LoginController(
          LoginRepositoryImp(
            HttpClientImp(),
          ),
        )),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => LoginPage()),
  ];
}
