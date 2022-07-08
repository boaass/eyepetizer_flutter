import 'package:eyepetizer/core/model/card_model.dart';
import 'package:eyepetizer/core/viewmodel/topic_detail_view_model.dart';
import 'package:eyepetizer/core/viewmodel/user_center_view_model.dart';
import 'package:eyepetizer/core/viewmodel/video_detail_view_model.dart';
import 'package:eyepetizer/ui/pages/detail/user_center.dart';
import 'package:eyepetizer/ui/pages/detail/video_detail.dart';
import 'package:eyepetizer/ui/shared/size_fit.dart';
import 'package:flutter/material.dart';
import 'package:eyepetizer/core/extention/num_extention.dart';
import 'package:provider/provider.dart';


class ZCLSlideCoverVideoWithAuthor extends StatefulWidget {
  final ZCLMetro? model;
  const ZCLSlideCoverVideoWithAuthor({Key? key, required this.model}) : super(key: key);

  @override
  _ZCLSlideCoverVideoWithAuthorState createState() => _ZCLSlideCoverVideoWithAuthorState();
}

class _ZCLSlideCoverVideoWithAuthorState extends State<ZCLSlideCoverVideoWithAuthor> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<ZCLVideoDetailNotifier>(context, listen: false).updateVideoId(widget.model!.video_id!);
        Navigator.of(context).pushNamed(ZCLVideoDetailPage.routeName);
      },
      child: Container(
        margin: EdgeInsets.only(left: 10.px),
        width: 300.px,
        child: Column(
          children: [
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                alignment: Alignment.center,
                children: [
                  Image.network(widget.model!.metroData!.cover!.url!, fit: BoxFit.fill),
                  Icon(Icons.play_arrow, color: Colors.white, size: 40.px)
                ],
              ),
            ),
            ListTile(
              onTap: () {
                Provider.of<ZCLUserCenterNotifier>(context, listen: false).link = widget.model!.author!.uid!.toString();
                Navigator.of(context).pushNamed(ZCLUserCenterPage.routeName);
              },
              leading: CircleAvatar(foregroundImage: NetworkImage(widget.model!.metroData!.author!.avatar!)),
              title: Text(widget.model!.metroData!.title!, style: Theme.of(context).textTheme.headline4),
              subtitle: Text(
                "${widget.model!.metroData!.author!.nick!} ${List.from(widget.model!.metroData!.tags!.map((e) => e.title)).join(" ")}",
                style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.black54),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
