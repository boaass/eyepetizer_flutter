import 'package:date_format/date_format.dart';
import 'package:eyepetizer/core/model/card_model.dart';
import 'package:eyepetizer/core/viewmodel/topic_detail_view_model.dart';
import 'package:eyepetizer/ui/pages/detail/topic_detail.dart';
import 'package:eyepetizer/ui/pages/detail/topic_detail_tag.dart';
import 'package:flutter/material.dart';
import 'package:eyepetizer/core/extention/num_extention.dart';
import 'package:provider/provider.dart';


class ZCLFeedCoverDetailTopic extends StatefulWidget {
  final ZCLMetro? model; 
  const ZCLFeedCoverDetailTopic({Key? key, required this.model}) : super(key: key);

  @override
  _ZCLFeedCoverDetailTopicState createState() => _ZCLFeedCoverDetailTopicState();
}

class _ZCLFeedCoverDetailTopicState extends State<ZCLFeedCoverDetailTopic> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Provider.of<ZCLTopicDetailNotifier>(context, listen: false).link = Uri.decodeFull(widget.model!.link!);
            Navigator.of(context).pushNamed(ZCLTopicDetailTagPage.routeName);
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10.px),
            height: 120.px,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(child: Container(
                  child: Image.network(widget.model!.metroData!.cover!.url!, fit: BoxFit.fill,))
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.px),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.model!.metroData!.title!,
                          style: Theme.of(context).textTheme.headline4,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          widget.model!.metroData!.description!,
                          style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.black54),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Row(children: List.from(widget.model!.metroData!.tags!.map((e) => Text(e.title!, style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.black26)))))
                      ],
                    ),
                  )
                )
              ],
            ),
          ),
        ),
        Container(
          height: 1.px,
          color: Colors.black54,
        )
      ],
    );
  }
}
