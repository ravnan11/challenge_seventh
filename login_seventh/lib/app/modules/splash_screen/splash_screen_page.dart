import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 4000)).then((_) {
      Modular.to.navigate('/login/');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: AvatarGlow(
        showTwoGlows: true,
        duration: Duration(milliseconds: 1950),
        glowColor: Color(0xFF29B6F6),
        shape: BoxShape.rectangle,
        endRadius: 600.0,
        child: Image.asset(
          'assets/images/logo.png',
          height: 300,
        ),
      ),
    );
  }
}
