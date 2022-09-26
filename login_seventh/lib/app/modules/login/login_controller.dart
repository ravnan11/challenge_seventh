import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_seventh/app/core/data/localStorage/local_storage.dart';
import 'package:login_seventh/app/core/widgets/auth_exception.dart';
import 'package:login_seventh/app/modules/login/login_model.dart';
import 'package:login_seventh/app/modules/login/login_repository.dart';

class LoginController extends ChangeNotifier {
  final LoginModel loginModel = LoginModel();
  final LocalStorage localStorage = LocalStorageImp();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String responseToken = "";
  bool isLoading = false;
  bool obscureValue = true;
  IconData obscureIcon = Icons.visibility_off;

  final LoginRepository repository;
  LoginController(this.repository);

  Future<int> login(
      BuildContext context, String username, String password) async {
    isLoading = true;
    notifyListeners();
    try {
      final response =
          await repository.login(username: username, password: password);
      if (response['statusCode'] == 400) {
        isLoading = false;
        Fluttertoast.showToast(
          msg: "Senha ou username invalido",
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 4,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        notifyListeners();
      } else if (response['statusCode'] == 200) {
        Modular.to.navigate('/home/');
        isLoading = false;
        responseToken = response['body']['token'];
        await localStorage.setItem('token', 'token', responseToken);
      }
      return response['statusCode'];
    } on AuthException catch (e) {
      isLoading = false;
      notifyListeners();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
      return 400;
    }
  }

  void logout() {
    Modular.to.navigate('/login/');
  }

  changeObscure() {
    obscureValue = !obscureValue;
    if (obscureValue) {
      obscureIcon = Icons.visibility_off;
    } else {
      obscureIcon = Icons.visibility;
    }
    notifyListeners();
  }
}
