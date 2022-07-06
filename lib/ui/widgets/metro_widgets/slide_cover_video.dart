import 'package:flutter/material.dart';
import 'package:eyepetizer/core/model/card_model.dart';
import 'package:eyepetizer/core/extention/num_extention.dart';
import 'package:video_player/video_player.dart';


class ZCLSlideCoverVideo extends StatefulWidget {
  const ZCLSlideCoverVideo({Key? key, required this.model}) : super(key: key);
  final ZCLMetro? model;

  @override
  _ZCLSlideCoverVideoState createState() => _ZCLSlideCoverVideoState();
}

class _ZCLSlideCoverVideoState extends State<ZCLSlideCoverVideo> {
  VideoPlayerController? _videoController;

  @override
  void initState() {
    super.initState();

    _initializeVideoPlayController();
  }

  @override
  void dispose() {
    _videoController?.dispose();
    super.dispose();
  }

  _initializeVideoPlayController() {
    if (widget.model!.autoplay == true) {
      if (_videoController?.dataSource != widget.model!.play_url!) {
        if (_videoController != null) {
          _videoController!.dispose();
        }
        _videoController =
        VideoPlayerController.network(widget.model!.play_url!)
          ..initialize().then((value) {
            setState(() {
              _videoController?.setVolume(0);
              _videoController?.play();
            });
          });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    _initializeVideoPlayController();
    return Container(
        padding: EdgeInsets.only(top: 10.px),
        width: 300.px,
        child: Stack(
            alignment: Alignment.center,
            children: [
              _videoController != null ?
              AspectRatio(
                  aspectRatio: _videoController!.value.aspectRatio,
                  child: VideoPlayer(_videoController!,))
                  : Image.network(widget.model!.cover!, fit: BoxFit.fill),
              Icon(Icons.play_arrow, color: Colors.white, size: 40.px)
            ]
        )
    );
  }
}
