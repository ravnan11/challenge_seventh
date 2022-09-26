import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_seventh/app/core/image/app_images.dart';
import 'package:login_seventh/app/modules/login/login_controller.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final LoginController loginController = Modular.get();

    return Drawer(
      width: size.width * .7,
      backgroundColor: Color(0xFF1A1C1E),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 150,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF1A1C1E),
              ),
              padding: EdgeInsets.all(25),
              child: Container(
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Image.asset(AppImages.avatar),
                    ),
                    Padding(
                      padding: EdgeInsets.all(6.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'FLASH COURIER',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: '',
                              fontSize: 16,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'Minha conta',
                                style: TextStyle(color: Colors.white),
                              ),
                              Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              color: Colors.white,
            ),
            title: Text(
              'Home',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onTap: () {
              Modular.to.navigate('/home/');
            },
          ),
          Divider(
            thickness: 0.2,
            color: Colors.white,
            height: 1,
          ),
          ListTile(
            title: Text(
              'Sair',
              style: TextStyle(
                color: Colors.red,
              ),
            ),
            onTap: () {
              loginController.logout();
            },
          ),
        ],
      ),
    );
  }
}
