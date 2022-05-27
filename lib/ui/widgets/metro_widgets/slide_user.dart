import 'package:eyepetizer/ui/shared/size_fit.dart';
import 'package:flutter/material.dart';
import 'package:eyepetizer/core/model/card_model.dart';
import 'package:eyepetizer/core/extention/num_extention.dart';


class ZCLSlideUser extends StatelessWidget {
  const ZCLSlideUser({Key? key, required this.model}) : super(key: key);
  final ZCLMetro? model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.px),
      width: ZCLSizeFit.screenWidth!/3.5,
      decoration: BoxDecoration(
          border: Border.all(width: 1.px, color: Colors.black54)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            foregroundImage: NetworkImage(model!.avatar!.url!),
          ),
          Text(model!.nick!, style: Theme.of(context).textTheme.headline5, textAlign: TextAlign.center,),
          Text("${model!.follow_count}关注|${model!.fans_count}粉丝", style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.black54),),
          // widget.model!.followed! ?
          Container(
            width: double.maxFinite,
            color: Colors.black,
            child: Icon(Icons.add, color: Colors.white,),
          )
        ],
      ),
    );
  }
}
