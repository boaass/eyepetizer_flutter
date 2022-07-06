import 'package:eyepetizer/core/model/card_model.dart';
import 'package:eyepetizer/core/viewmodel/topic_detail_view_model.dart';
import 'package:eyepetizer/core/viewmodel/ugc_pic_detail_view_model.dart';
import 'package:eyepetizer/ui/pages/detail/ugc_pic_detail.dart';
import 'package:flutter/material.dart';
import 'package:eyepetizer/core/extention/num_extention.dart';
import 'package:provider/provider.dart';


class ZCLSearchResultImage extends StatelessWidget {
  final ZCLMetro? model;
  const ZCLSearchResultImage({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<ZCLUgcPicDetailNotifier>(context, listen: false).id = model?.metroData?.resourceId ?? "";
        Navigator.of(context).pushNamed(ZCLUgcPicDetailPage.routeName);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.px),
        height: 120.px,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 2,
              child: Image.network(model!.metroData!.cover!.url!, fit: BoxFit.fill)
            ),
            Expanded(
              flex: 3,
              child: Container(
                margin: EdgeInsets.all(10.px),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(model!.metroData!.title!, maxLines: 2, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.headline4),
                    Text(
                      "${model!.metroData!.consumption!.like_count}人点赞|${model!.metroData!.consumption!.collection_count}人收藏",
                      style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.black54),)
                  ],
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}
