import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_seventh/app/modules/splash_screen/splash_screen_module.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: SplashScreenModule()),
    ModuleRoute('/home/', module: HomeModule()),
    ModuleRoute('/login/', module: HomeModule()),
  ];
}
