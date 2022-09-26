import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_seventh/app/core/widgets/auth_exception.dart';
import 'package:login_seventh/app/core/widgets/logading_widget.dart';
import 'package:login_seventh/app/modules/home/home_controller.dart';
import 'package:login_seventh/app/modules/home/widget/appbar_widget.dart';
import 'package:login_seventh/app/modules/home/widget/chewie_list_item.dart';
import 'package:login_seventh/app/modules/home/widget/drawer_widget.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = 'Home'}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController controller = Modular.get();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Color mainColor = Color(0xFF1A1C1E);
    return FutureBuilder(
      future: controller.getVideo(),
      builder: ((context, snapshot) {
        return controller.responseVideo == ""
            ? LoadingComponent()
            : Scaffold(
                backgroundColor: mainColor,
                drawer: DrawerWidget(),
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(56.0),
                  child: HomeAppbar(),
                ),
                body: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: ChewieListItem(
                    videoPlayerController: VideoPlayerController.network(
                      controller.responseVideo,
                    ),
                    looping: true,
                  ),
                ),
              );
      }),
    );
  }
}
