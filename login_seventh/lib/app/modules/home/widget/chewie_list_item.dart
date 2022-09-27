import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_seventh/app/modules/login/login_controller.dart';
import 'package:video_player/video_player.dart';

class ChewieListItem extends StatefulWidget {
  final bool looping;
  final VideoPlayerController videoPlayerController;

  const ChewieListItem({
    required this.videoPlayerController,
    required this.looping,
    Key? key,
  }) : super(key: key);

  @override
  _ChewieListItemState createState() => _ChewieListItemState();
}

class _ChewieListItemState extends State<ChewieListItem> {
  late ChewieController _chewieController;
  final LoginController loginController = Modular.get();

  @override
  void initState() {
    super.initState();

    _chewieController = ChewieController(
      videoPlayerController: widget.videoPlayerController,
      autoPlay: true,
      autoInitialize: true,
      aspectRatio: 16 / 9,
      looping: widget.looping,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Chewie(
        controller: _chewieController,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    widget.videoPlayerController.dispose();
    _chewieController.dispose();
  }
}
