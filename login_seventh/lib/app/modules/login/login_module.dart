import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_seventh/app/modules/login/login_controller.dart';
import 'package:login_seventh/app/modules/login/login_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => LoginController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => LoginPage()),
  ];
}
