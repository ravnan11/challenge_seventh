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
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    return Stack(
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
              child: Column(
                children: [
                  SizedBox(
                    height: isKeyboard ? size.height * .1 : size.height * .3,
                  ),
                  Image.asset(
                    AppImages.shield,
                    width: 50,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Sistemas utilizados pelos gigantes do mercado",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Montserrat",
                      fontSize: 12,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
            top: isKeyboard ? size.height * .25 : size.height * .50,
          ),
          child: Align(
            alignment: Alignment.topCenter,
            child: LoginForm(),
          ),
        )
      ],
    );
  }
}
