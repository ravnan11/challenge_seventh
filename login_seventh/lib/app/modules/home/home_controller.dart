import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_seventh/app/core/data/localStorage/local_storage.dart';
import 'package:login_seventh/app/modules/home/home_repository.dart';
import 'package:login_seventh/app/modules/login/login_controller.dart';

class HomeController extends ChangeNotifier {
  final LoginController loginController = Modular.get();
  final LocalStorage localStorage = LocalStorageImp();
  bool isLoading = false;
  String responseVideo = "";
  final formKey = GlobalKey;

  final HomeRepository repository;
  HomeController(this.repository);

  getVideo() async {
    isLoading = true;
    notifyListeners();
    try {
      var token = await localStorage.getItem('token', 'token');
      final response = await repository.getVideo(token: token);
      responseVideo = response['body']['url'];
    } catch (e) {
      return e.toString();
    }
    notifyListeners();
  }
}
