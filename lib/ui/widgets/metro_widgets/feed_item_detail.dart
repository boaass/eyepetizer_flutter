import 'package:eyepetizer/core/viewmodel/topic_detail_view_model.dart';
import 'package:eyepetizer/core/viewmodel/ugc_pic_detail_view_model.dart';
import 'package:eyepetizer/core/viewmodel/video_detail_view_model.dart';
import 'package:eyepetizer/ui/pages/detail/ugc_pic_detail.dart';
import 'package:eyepetizer/ui/pages/detail/video_detail.dart';
import 'package:flutter/material.dart';
import 'package:eyepetizer/core/model/card_model.dart';
import 'package:eyepetizer/core/extention/num_extention.dart';
import 'package:provider/provider.dart';
import '../expandable_text.dart';


class ZCLFeedItemDetail extends StatelessWidget {
  const ZCLFeedItemDetail({Key? key, required this.model}) : super(key: key);
  final ZCLMetro? model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (model!.metroData!.video != null && model!.metroData!.video!.video_id!.isNotEmpty) {
          Provider.of<ZCLVideoDetailNotifier>(context, listen: false).updateVideoId(model!.metroData!.video!.video_id!);
          Navigator.of(context).pushNamed(ZCLVideoDetailPage.routeName);
        } else {
          Provider.of<ZCLUgcPicDetailNotifier>(context, listen: false).id = model?.metroData?.resourceId ?? "";
          Navigator.of(context).pushNamed(ZCLUgcPicDetailPage.routeName);
        }
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(10.px, 15.px, 10.px, 2.px),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(
              foregroundImage: NetworkImage(model!.author!.avatar!),
            ),
            title: Text(model!.author!.nick!, style: Theme
                .of(context)
                .textTheme
                .headline4,),
            subtitle: Row(
              children: [
                Text(
                    model!.publish_time!,
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline5!
                        .copyWith(color: Colors.black54)),
              ]..add(Container(width: 10.px,))..addAll((model!.metroData!.location != null && model!.metroData!.location!.city != "") ? [Icon(Icons.location_on, size: 10.px,), Text(model!.metroData!.location!.city!, style: Theme
                    .of(context)
                    .textTheme
                    .headline5!
                    .copyWith(color: Colors.black54))] : [Container()]),
            ),
            trailing: Icon(Icons.add_box, color: Colors.black, size: 30.px,),),
            model!.metroData!.topics!.length == 0 ? Container() :
            Padding(
              padding: EdgeInsets.only(bottom: 10.px),
              child: Row(
                children: model!.metroData!.topics!.map((e) => Container(
                    padding: EdgeInsets.fromLTRB(5.px, 1.px, 5.px, 1.px),
                    decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(10.px)
                    ),
                    child: Text(e.title!, style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white),)
                )).toList(),
              ),
            ),
            model!.metroData!.images!.length != 0 ?
            MediaQuery.removePadding( // 移除边距
              removeTop: true,
              removeBottom: true,
              context: context,
              child: GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: _calculateCrossAxisCountForTotalCount(model!.metroData!.images!.length),
                mainAxisSpacing: 3.px,
                crossAxisSpacing: 3.px,
                childAspectRatio: 1,
                children: model!.metroData!.images!.map((e) => Image.network(e.cover!.url!, fit: BoxFit.cover,)).toList(),
              ),
            ) :
            model!.metroData!.video != null ?
            Stack(
              alignment: Alignment.center,
              children: [
                Image.network(model!.metroData!.video!.cover!, fit: BoxFit.fitWidth,),
                Icon(Icons.play_arrow, color: Colors.white, size: 50.px,)
              ],
            ) : Container(),
            Container(
              padding: EdgeInsets.only(top: 5.px),
              child: ExpandableText(
                text: model!.text,
                maxLines: 3,
                style: Theme.of(context).textTheme.headline4,
                expand: false,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10.px),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      _buildFooterItem(Icons.thumb_up_alt_outlined, model!.consumption!.like_count!),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5.px),
                        child: _buildFooterItem(Icons.star_border_outlined, model!.consumption!.collection_count!)
                      ),
                      _buildFooterItem(Icons.messenger_outline_rounded, model!.consumption!.comment_count!),
                    ],
                  ),
                  Icon(Icons.share_outlined)
                ],
              ),
            ),
            _buildDivider()
          ],
        )
      ),
    );
  }

  _calculateCrossAxisCountForTotalCount(int count) {
    if (count <= 3) {
      return count;
    } else if (count == 4) {
      return 2;
    }
    return 3;
  }

  _buildFooterItem(IconData icon, int count) {
    return Row(
        children: [
          Icon(icon),
          SizedBox(width: 5.px,),
          Text(count.toString())
        ]
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
