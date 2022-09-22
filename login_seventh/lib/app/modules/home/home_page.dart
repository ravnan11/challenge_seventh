import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_seventh/app/modules/home/home_controller.dart';
import 'package:login_seventh/app/modules/home/widget/chewie_list_item.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = 'Home'}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final HomeController controller = Modular.get();
    print('Valor do url response');
    print(controller.responseVideo);
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Player'),
      ),
      body: AspectRatio(
        aspectRatio: 16 / 9,
        child: ChewieListItem(
          videoPlayerController: VideoPlayerController.network(
            'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
          ),
          looping: false,
        ),
      ),
    );
  }
}
