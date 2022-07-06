import 'package:eyepetizer/core/model/topic_detail_tag_model.dart';
import 'package:eyepetizer/core/viewmodel/video_detail_view_model.dart';
import 'package:eyepetizer/ui/pages/detail/video_detail.dart';
import 'package:eyepetizer/ui/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:eyepetizer/core/extention/num_extention.dart';
import 'package:provider/provider.dart';


class ZCLSmallVideoBeanForClient extends StatelessWidget {
  const ZCLSmallVideoBeanForClient({Key? key, required this.item}) : super(key: key);
  final ItemList item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<ZCLVideoDetailNotifier>(context, listen: false).updateVideoId(item.data!.id!.toString());
        Navigator.of(context).pushNamed(ZCLVideoDetailPage.routeName);
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(20.px, 10.px, 20.px, 10.px),
        height: 120.px,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(item.data!.cover!.feed!, fit: BoxFit.fill),
                  Positioned(
                    right: 5.px,
                    bottom: 5.px,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(5.px))
                      ),
                      child: Text(ZCLUtils.secondToTimeText(item.data!.duration!), style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white)),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.fromLTRB(10.px, 5.px, 10.px, 5.px),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        item.data!.title!,
                        style: Theme.of(context).textTheme.headline5!.copyWith(fontWeight: FontWeight.bold),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            "# ${item.data!.category}",
                            style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.black54)
                        ),
                        Icon(Icons.upload_sharp, color: Colors.grey)
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
