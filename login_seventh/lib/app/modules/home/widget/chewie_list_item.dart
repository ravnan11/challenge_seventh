import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:login_seventh/app/core/widgets/logading_widget.dart';
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
    return _chewieController != null
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Chewie(
              controller: _chewieController,
            ),
          )
        : LoadingComponent();
  }

  @override
  void dispose() {
    super.dispose();
    widget.videoPlayerController.dispose();
    _chewieController.dispose();
  }
}
