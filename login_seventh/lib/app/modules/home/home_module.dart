import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_seventh/app/core/data/http/http.dart';
import 'package:login_seventh/app/modules/home/home_repository.dart';
import 'home_controller.dart';

import 'home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
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
    ChildRoute(Modular.initialRoute, child: (_, args) => HomePage()),
  ];
}
