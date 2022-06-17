import 'package:date_format/date_format.dart';
import 'package:eyepetizer/core/viewmodel/video_detail_view_model.dart';
import 'package:eyepetizer/ui/pages/detail/video_detail.dart';
import 'package:eyepetizer/ui/widgets/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:eyepetizer/core/model/topic_detail_tag_model.dart';
import 'package:eyepetizer/core/extention/num_extention.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';


class ZCLVideoBeanForClientWidget extends StatefulWidget {
  final ItemList item;

  const ZCLVideoBeanForClientWidget({Key? key, required this.item}) : super(key: key);

  @override
  _ZCLVideoBeanForClientWidgetState createState() => _ZCLVideoBeanForClientWidgetState();
}

class _ZCLVideoBeanForClientWidgetState extends State<ZCLVideoBeanForClientWidget> {

  VideoPlayerController? _videoPlayerController;

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
            _videoPlayerController?.play();
            _videoPlayerController?.setLooping(true);
          });
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    _initializeVideoPlayController();
    return Container(
      padding: EdgeInsets.fromLTRB(20.px, 20.px, 20.px, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildAuthHeader(),
          _buildContent(),
          _buildTags(),
          _buildVideo(widget.item.data!.content!.data!),
          _buildBottomButton(widget.item.data!.content!.data!.consumption!),
          _buildDivider()
        ],
      ),
    );
  }

  _buildAuthHeader() {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(foregroundImage: NetworkImage(widget.item.data!.content!.data!.author!.icon!)),
      title: Text(widget.item.data!.content!.data!.author!.name!, style: Theme.of(context).textTheme.headline4),
      subtitle: Row(
        children: [
          Text(_formatTimestamp(widget.item.data!.content!.data!.releaseTime!)+" 发布: ", style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.black26)),
          Expanded(
            child: Text(widget.item.data!.content!.data!.title!, style: Theme.of(context).textTheme.headline5, maxLines: 1, overflow: TextOverflow.ellipsis)
          )
        ],
      ),
    );
  }

  _buildContent() {
    return Container(
      child: ExpandableText(
        text: widget.item.data!.content!.data!.description,
        maxLines: 2,
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }

  _buildTags() {
    return Container(
      child: Wrap(
        spacing: 5.px,
        runSpacing: 5.px,
        children: List.from(widget.item.data!.content!.data!.tags!.map((e) => _buildTagWidget(e.name!))),
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

  _buildTagWidget(String tag) {
    return Container(
      padding: EdgeInsets.fromLTRB(3.px, 5.px, 3.px, 5.px),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(5.px)
      ),
      child: Text(tag, style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.blue.shade300)),
    );
  }

  _buildVideo(ContentData data) {
    return GestureDetector(
      onTap: () {
        Provider.of<ZCLVideoDetailNotifier>(context, listen: false).updateVideoId(widget.item.data!.content!.data!.id!.toString());
        Navigator.of(context).pushNamed(ZCLVideoDetailPage.routeName);
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.px)
        ),
        margin: EdgeInsets.only(top: 10.px),
        child: AspectRatio(
          aspectRatio: 5/3, //_videoPlayerController!.value.aspectRatio,
          child: VideoPlayer(_videoPlayerController!),
        ),
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
