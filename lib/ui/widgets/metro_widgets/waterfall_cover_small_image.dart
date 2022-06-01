import 'package:eyepetizer/core/model/card_model.dart';
import 'package:flutter/material.dart';
import 'package:eyepetizer/core/extention/num_extention.dart';

class ZCLWaterfallCoverSmallImage extends StatefulWidget {
  const ZCLWaterfallCoverSmallImage({Key? key, required this.model}) : super(key: key);
  final ZCLMetro model;

  @override
  _ZCLWaterfallCoverSmallImageState createState() => _ZCLWaterfallCoverSmallImageState();
}

class _ZCLWaterfallCoverSmallImageState extends State<ZCLWaterfallCoverSmallImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.px),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Image.network(widget.model.cover!, fit: BoxFit.fill)
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
    );
  }
}
