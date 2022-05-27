import 'package:eyepetizer/ui/shared/size_fit.dart';
import 'package:flutter/material.dart';
import 'package:eyepetizer/core/model/card_model.dart';
import 'package:eyepetizer/core/extention/num_extention.dart';


class ZCLTopicIntro extends StatelessWidget {
  const ZCLTopicIntro({Key? key, required this.model}) : super(key: key);
  final ZCLMetro? model;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 50.px),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Image.network(
            model!.background!.url!,
            width: ZCLSizeFit.screenWidth,
            height: ZCLSizeFit.screenWidth,
            fit: BoxFit.fill,
          ),
          Positioned(
            bottom: -50.px,
            child: Container(
              color: Color(0xFFEEEEEE),
              width: ZCLSizeFit.screenWidth! - 50.px,
              height: 100.px,
              child: Padding(
                padding: EdgeInsets.fromLTRB(30.px, 0, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(model!.title!, style: Theme.of(context).textTheme.headline3,),
                    Text(model!.tags![0], style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.black54),)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
