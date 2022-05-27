import 'package:flutter/material.dart';
import 'package:eyepetizer/core/model/card_model.dart';
import 'package:eyepetizer/core/extention/num_extention.dart';


class ZCLFeedCoverSmallVideo extends StatelessWidget {
  const ZCLFeedCoverSmallVideo({Key? key, required this.model}) : super(key: key);
  final ZCLMetro? model;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.px),
      height: 120.px,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black54)
      ),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.network(model!.cover!),
              Icon(Icons.play_arrow, color: Colors.white, size: 60.px,),
            ],
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.fromLTRB(10.px, 5.px, 10.px, 5.px),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      model!.title!,
                      style: Theme.of(context).textTheme.headline4!.copyWith(fontWeight: FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          "${model!.tags!.join(" ")}",
                          style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.black54)
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 4.px),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black54, ),
                          borderRadius: BorderRadius.circular(15.px),
                        ),
                        child: Text(model!.duration!.text!, style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.black54),),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
