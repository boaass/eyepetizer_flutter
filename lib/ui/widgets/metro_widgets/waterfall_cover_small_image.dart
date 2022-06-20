import 'package:eyepetizer/core/model/card_model.dart';
import 'package:eyepetizer/core/viewmodel/topic_detail_view_model.dart';
import 'package:eyepetizer/ui/pages/detail/ugc_pic_detail.dart';
import 'package:flutter/material.dart';
import 'package:eyepetizer/core/extention/num_extention.dart';
import 'package:provider/provider.dart';

class ZCLWaterfallCoverSmallImage extends StatefulWidget {
  const ZCLWaterfallCoverSmallImage({Key? key, required this.model}) : super(key: key);
  final ZCLMetro model;

  @override
  _ZCLWaterfallCoverSmallImageState createState() => _ZCLWaterfallCoverSmallImageState();
}

class _ZCLWaterfallCoverSmallImageState extends State<ZCLWaterfallCoverSmallImage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<ZCLTopicDetailNotifier>(context, listen: false).link = widget.model.link ?? "";
        Navigator.of(context).pushNamed(ZCLUgcPicDetailPage.routeName);
      },
      child: Container(
        margin: EdgeInsets.all(10.px),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(widget.model.cover!, fit: BoxFit.fill),
                  widget.model.metroData!.imageCount! <= 1 ? Container() :
                  Positioned(
                    left: 5.px,
                    top: 5.px,
                    child: Icon(Icons.file_copy_outlined, color: Colors.white,)
                  )
                ]
              )
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.px),
              child: Text(widget.model.title!, style: Theme.of(context).textTheme.headline5, maxLines: 1, overflow: TextOverflow.ellipsis,),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.px),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 15.px,
                        width: 15.px,
                        child: CircleAvatar(
                          foregroundImage: NetworkImage(widget.model.author!.avatar!)
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 3.px),
                        child: Text(widget.model.author!.nick!, style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.black26)),
                      ),
                    ],
                  ),
                  Icon(Icons.thumb_up_outlined, size: 15.px,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
