import 'package:eyepetizer/ui/widgets/material_controls.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';


class KYChewieVideoWidget extends StatefulWidget {
  const KYChewieVideoWidget({Key? key, required this.playUrl, required this.videoPlayerController}) : super(key: key);

  final String playUrl;
  final double aspectRatio = 3/2;
  final VideoPlayerController videoPlayerController;

  @override
  _KYChewieVideoWidgetState createState() => _KYChewieVideoWidgetState();
}

class _KYChewieVideoWidgetState extends State<KYChewieVideoWidget> {

  // late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();

    // _videoPlayerController = VideoPlayerController.network(widget.playUrl);
    _chewieController = ChewieController(
      videoPlayerController: widget.videoPlayerController,
      autoPlay: true,
      aspectRatio: widget.aspectRatio,
      customControls: KYMaterialControls()
    );
  }

  @override
  void dispose() {
    // _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AspectRatio(
        aspectRatio: widget.aspectRatio,
        child: Chewie(
          controller: _chewieController,
        )
      ),
    );
  }
}
