import 'package:eyepetizer/core/model/card_model.dart';
import 'package:flutter/material.dart';
import 'package:eyepetizer/core/extention/num_extention.dart';

class ZCLWaterfallCoverSmallVideo extends StatefulWidget {
  const ZCLWaterfallCoverSmallVideo({Key? key, required this.model}) : super(key: key);
  final ZCLMetro model;

  @override
  _ZCLWaterfallCoverSmallVideoState createState() => _ZCLWaterfallCoverSmallVideoState();
}

class _ZCLWaterfallCoverSmallVideoState extends State<ZCLWaterfallCoverSmallVideo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.px),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(widget.model.cover!, fit: BoxFit.fill),
                Positioned(
                  left: 10.px,
                  top: 10.px,
                  child: Icon(Icons.play_arrow, color: Colors.white,)
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
    );
  }
}
