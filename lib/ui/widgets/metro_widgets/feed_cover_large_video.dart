import 'package:flutter/material.dart';
import 'package:eyepetizer/core/model/card_model.dart';
import 'package:eyepetizer/core/extention/num_extention.dart';
import 'package:video_player/video_player.dart';

class ZCLFeedCoverLargeVideo extends StatefulWidget {
  const ZCLFeedCoverLargeVideo({Key? key, required this.model}) : super(key: key);
  final ZCLMetro? model;

  @override
  _ZCLFeedCoverLargeVideoState createState() => _ZCLFeedCoverLargeVideoState();
}

class _ZCLFeedCoverLargeVideoState extends State<ZCLFeedCoverLargeVideo> {

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
      key: widget.model!.stickyKey,
      child: Column(
        children: [
          _buildFeedCoverLargeVideoBody(),
          widget.model!.videoPlayerAspectRatio! == 0 ? _buildFeedCoverLargeVideoFooter(Colors.black, Colors.black54) : Container(),
          widget.model!.videoPlayerAspectRatio! != 0 ? Padding(
              padding: EdgeInsets.fromLTRB(0, 20.px, 0, 10.px),
              child: Image.asset("lib/res/images/staff_pick.png")) : Container(),
          _buildDivider()
        ],
      ),
    );
  }

  _buildFeedCoverLargeVideoBody() {
    if (widget.model?.autoplay == true) {
      return Stack(
        alignment: AlignmentDirectional.center,
        children: [
          _videoController!.value.isInitialized ? AspectRatio(
              aspectRatio: (widget.model!.videoPlayerAspectRatio! == 0) ? _videoController!.value.aspectRatio : widget.model!.videoPlayerAspectRatio!,
              child: VideoPlayer(_videoController!)
          ) : Image.network(widget.model!.cover!
          ),
          // Icon(Icons.play_arrow, color: Colors.white, size: 60.px,),
          widget.model!.duration!.text == "" ? Container() : Positioned(
              bottom: 10.px,
              right: 10.px,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 4.px),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, ),
                  borderRadius: BorderRadius.circular(15.px),
                ),
                child: Text(widget.model!.duration!.text!, style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white),),
              )
          ),
          Positioned(
              left: 10.px,
              top: 10.px,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _videoController!.setVolume(_videoController!.value.volume == 0 ? 1 : 0);
                  });
                },
                child: (_videoController!.value.isInitialized && (_videoController!.value.volume) != 0) ?
                Icon(Icons.volume_up, color: Colors.white,) :
                Icon(Icons.volume_off, color: Colors.white,),
              )
          ),
          widget.model!.videoPlayerAspectRatio! == 0 ? Container() : Positioned(left: 0, right: 0, bottom: 10.px, child: _buildFeedCoverLargeVideoFooter(Colors.white, Colors.white))
        ],
      );
    } else {
      return Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Image.network(widget.model!.cover!),
          Icon(Icons.play_arrow, color: Colors.white, size: 60.px,),
          Positioned(
              bottom: 10.px,
              right: 10.px,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 4.px),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, ),
                  borderRadius: BorderRadius.circular(15.px),
                ),
                child: Text(widget.model!.duration!.text!, style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white),),
              )
          ),
        ],
      );
    }
  }

  _buildFeedCoverLargeVideoFooter(Color titleColor, Color subTitleColor) {
    return Container(
        padding: EdgeInsets.fromLTRB(10.px, 5.px, 10.px, 5.px),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(
            foregroundImage: NetworkImage(widget.model!.author!.avatar!),
          ),
          title: Text(widget.model!.title!, style: Theme
              .of(context)
              .textTheme
              .headline4!.copyWith(color: titleColor),),
          subtitle: Text(
              "${widget.model!.author!.nick} ${widget.model!.tags!.join(" ")}",
              style: Theme
                  .of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: subTitleColor)),
        )
    );
  }

  _buildDivider() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10.px, 0, 0),
      color: Colors.black54,
      height: 1.px,
    );
  }
}
