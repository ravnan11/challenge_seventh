import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_seventh/app/core/data/http/http.dart';
import 'package:login_seventh/app/modules/home/home_controller.dart';
import 'package:login_seventh/app/modules/home/home_repository.dart';
import 'package:login_seventh/app/modules/login/login_controller.dart';
import 'package:login_seventh/app/modules/login/login_module.dart';
import 'package:login_seventh/app/modules/login/login_repository.dart';
import 'package:login_seventh/app/modules/splash_screen/splash_screen_module.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton(
      (i) => LoginController(
        LoginRepositoryImp(
          HttpClientImp(),
        ),
      ),
    ),
    Bind.lazySingleton(
      (i) => HomeController(
        HomeRepositoryImp(
          HttpClientImp(),
        ),
      ),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: SplashScreenModule()),
    ModuleRoute('/home/', module: HomeModule()),
    ModuleRoute('/login/', module: LoginModule()),
  ];
}
