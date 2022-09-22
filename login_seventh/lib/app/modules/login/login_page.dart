import 'package:flutter/material.dart';
import 'package:login_seventh/app/core/image/app_images.dart';
import 'package:login_seventh/app/modules/login/widget/login_form_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: size.height,
                width: size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF03A9F4),
                      Color(0xFF03A9F4),
                      Color(0xFF81D4FA),
                      Color(0xFF4FC3F7),
                      Color(0xFF29B6F6),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: SafeArea(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 50),
                        child: Image.asset(
                          AppImages.logotipo,
                          width: 100,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Sistemas utilizados pelos gigantes do mercado',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: size.width,
              height: size.height * .50,
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(5, 5),
                    blurRadius: 10,
                  ),
                ],
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(70),
                  topLeft: Radius.circular(70),
                ),
              ),
              child: LoginForm(),
            ),
          ),
        ],
      ),
    );
  }
}
