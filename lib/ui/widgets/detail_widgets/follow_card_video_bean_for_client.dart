import 'package:date_format/date_format.dart';
import 'package:eyepetizer/core/viewmodel/topic_detail_view_model.dart';
import 'package:eyepetizer/core/viewmodel/user_center_view_model.dart';
import 'package:eyepetizer/core/viewmodel/video_detail_view_model.dart';
import 'package:eyepetizer/ui/pages/detail/user_center.dart';
import 'package:eyepetizer/ui/pages/detail/video_detail.dart';
import 'package:eyepetizer/ui/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:eyepetizer/core/model/topic_detail_tag_model.dart';
import 'package:eyepetizer/core/extention/num_extention.dart';
import 'package:provider/provider.dart';


class ZCLFollowCardVideoBeanForClientWidget extends StatefulWidget {
  final ItemList item;

  const ZCLFollowCardVideoBeanForClientWidget({Key? key, required this.item}) : super(key: key);

  @override
  _ZCLFollowCardVideoBeanForClientWidgetState createState() => _ZCLFollowCardVideoBeanForClientWidgetState();
}

class _ZCLFollowCardVideoBeanForClientWidgetState extends State<ZCLFollowCardVideoBeanForClientWidget> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20.px, 20.px, 20.px, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildContent(),
          _buildAuth(),
        ],
      ),
    );
  }

  _buildContent() {
    return GestureDetector(
      onTap: () {
        Provider.of<ZCLVideoDetailNotifier>(context, listen: false).updateVideoId(widget.item.data!.content!.data!.id!.toString());
        Navigator.of(context).pushNamed(ZCLVideoDetailPage.routeName);
      },
      child: Container(
        child: Stack(
          children: [
            Image.network(widget.item.data!.content!.data!.cover!.detail!),
            Positioned(
              right: 5.px,
              bottom: 5.px,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(5.px)
                ),
                child: Text("${ZCLUtils.secondToTimeText(widget.item.data!.content!.data!.duration!)}", style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white),)
              )
            )
          ]
        ),
      ),
    );
  }

  _buildAuth() {
    return ListTile(
      onTap: () {
        Provider.of<ZCLUserCenterNotifier>(context, listen: false).link = widget.item.data!.content!.data!.author!.id.toString();
        Navigator.of(context).pushNamed(ZCLUserCenterPage.routeName);
      },
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(foregroundImage: NetworkImage(widget.item.data!.content!.data!.author!.icon!)),
      title: Text(widget.item.data!.content!.data!.author!.name!, style: Theme.of(context).textTheme.headline4),
      subtitle: Row(
        children: [
          Text(_formatTimestamp(widget.item.data!.content!.data!.releaseTime!), style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.black54)),
          Expanded(
              child: Text(" / #${widget.item.data!.content!.data!.category!}", style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.black54), maxLines: 1, overflow: TextOverflow.ellipsis)
          )
        ],
      ),
    );
  }


  _formatTimestamp(int time) {
    return formatDate(DateTime.fromMillisecondsSinceEpoch(time), [yyyy,'/',mm,'/',dd]);
  }
}
