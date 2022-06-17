import 'package:date_format/date_format.dart';
import 'package:eyepetizer/core/model/topic_detail_tag_model.dart';
import 'package:eyepetizer/ui/widgets/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:eyepetizer/core/extention/num_extention.dart';
import 'package:video_player/video_player.dart';


class ZCLUGCVideoBeanWidget extends StatefulWidget {
  const ZCLUGCVideoBeanWidget({Key? key, required this.item}) : super(key: key);
  final ItemList item;

  @override
  _ZCLUGCVideoBeanWidgetState createState() => _ZCLUGCVideoBeanWidgetState();
}

class _ZCLUGCVideoBeanWidgetState extends State<ZCLUGCVideoBeanWidget> {

  VideoPlayerController? _videoPlayerController;
  double _playProgress = 0;

  @override
  void initState() {

    _initializeVideoPlayController();

    super.initState();
  }

  @override
  void dispose() {
    _videoPlayerController?.dispose();
    super.dispose();
  }

  _initializeVideoPlayController() {
    if (_videoPlayerController?.dataSource != widget.item.data!.content!.data!.playUrl) {
      if (_videoPlayerController != null) {
        _videoPlayerController!.dispose();
      }

      _videoPlayerController =
      VideoPlayerController.network(widget.item.data!.content!.data!.playUrl!)
        ..initialize().then((value) {
          setState(() {
            _videoPlayerController?.setVolume(0);
            _videoPlayerController?.play();
            _videoPlayerController?.setLooping(true);
          });
        });

      _videoPlayerController?.addListener(() {
        setState(() {
          _playProgress = _videoPlayerController!.value.position.inSeconds/_videoPlayerController!.value.duration.inSeconds;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _initializeVideoPlayController();
    return Container(
      padding: EdgeInsets.fromLTRB(10.px, 10.px, 10.px, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: ListTile(
                contentPadding: EdgeInsets.zero,
                leading: CircleAvatar(foregroundImage: NetworkImage(widget.item
                    .data!.content!.data!.owner!.avatar!)),
                title: Text(widget.item.data!.content!.data!.owner!.nickname!,
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline3!
                        .copyWith(fontWeight: FontWeight.bold)),
                subtitle: Text("${_formatTimestamp(widget.item.data!.content!.data!.createTime!)} 发布:"),
                trailing: widget.item.data!.header!.topShow! ? Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text("置顶", style: Theme
                        .of(context)
                        .textTheme
                        .headline4!
                        .copyWith(color: Colors.blue),),
                  ),
                ) : Container(width: 1,)
            ),
          ),
          widget.item.data!.content!.data!.description == "" ? Container() :
          ExpandableText(
            text: widget.item.data!.content!.data!.description,
            maxLines: 2,
            style: Theme
                .of(context)
                .textTheme
                .headline3,
            expand: false,
          ),
          Container(
            margin: EdgeInsets.only(top: 10.px),
            padding: EdgeInsets.symmetric(horizontal: 8.px),
            decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.3),
                borderRadius: BorderRadius.circular(5)
            ),
            child: Text(
              widget.item.data!.content!.data!.tags!.first.name!, style: Theme
                .of(context)
                .textTheme
                .headline4!
                .copyWith(color: Colors.blue),),
          ),
          _buildVideo(widget.item.data!.content!.data!),
          _buildBottomButton(widget.item.data!.content!.data!.consumption!),
        ],
      ),
    );
  }

  _buildVideo(ContentData data) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.px)
      ),
      margin: EdgeInsets.only(top: 10.px),
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: 5/3, //_videoPlayerController!.value.aspectRatio,
            child: VideoPlayer(_videoPlayerController!),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 3.px,
              child: LinearProgressIndicator(
                backgroundColor: Colors.transparent,
                valueColor: AlwaysStoppedAnimation(Colors.blue),
                value: _playProgress,
              ),
            ))
        ],
      ),
    );
  }

  _buildBottomButton(Consumption consumption) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.px),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildActionButton(Icons.favorite_border_outlined, consumption.collectionCount!.toString()),
          _buildActionButton(Icons.chat_bubble_outline, consumption.replyCount!.toString()),
          _buildActionButton(Icons.star_border_outlined, "收藏"),
          _buildActionButton(Icons.publish, ""),
        ],
      ),
    );
  }

  _buildActionButton(IconData icon, String text) {
    return Row(
        children: [
          Icon(icon, color: Colors.grey,),
          SizedBox(width: 5.px,),
          Text(text, style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.grey),)
        ]
    );
  }

  _formatTimestamp(int time) {
    return formatDate(DateTime.fromMillisecondsSinceEpoch(time), [yyyy,'/',mm,'/',dd]);
  }
}
