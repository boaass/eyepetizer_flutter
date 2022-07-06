import 'package:eyepetizer/core/model/card_model.dart';
import 'package:eyepetizer/core/viewmodel/topic_detail_view_model.dart';
import 'package:eyepetizer/core/viewmodel/video_detail_view_model.dart';
import 'package:eyepetizer/ui/pages/detail/video_detail.dart';
import 'package:flutter/material.dart';
import 'package:eyepetizer/core/extention/num_extention.dart';
import 'package:provider/provider.dart';

class ZCLSearchCoverSmallVideo extends StatelessWidget {
  final ZCLMetro? model;
  const ZCLSearchCoverSmallVideo({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<ZCLVideoDetailNotifier>(context, listen: false).updateVideoId(model!.video_id!);
        Navigator.of(context).pushNamed(ZCLVideoDetailPage.routeName);
      },
      child: Container(
        height: 100.px,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(model!.metroData!.cover!.url!),
              )
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.px),
                child: Text(model!.metroData!.title!, style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.black54), maxLines: 2, overflow: TextOverflow.ellipsis,)
              )
            )
          ],
        ),
      ),
    );
  }
}
