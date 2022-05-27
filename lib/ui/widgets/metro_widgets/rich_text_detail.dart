import 'package:flutter/material.dart';
import 'package:eyepetizer/core/model/card_model.dart';
import 'package:eyepetizer/core/extention/num_extention.dart';


class ZCLRichTextDetail extends StatelessWidget {
  const ZCLRichTextDetail({Key? key, required this.model}) : super(key: key);
  final ZCLMetro? model;

  @override
  Widget build(BuildContext context) {
    Widget child = Container();
    if (model!.metroData!.type == "json") {
      child = Container(
        padding: EdgeInsets.all(10.px),
        child: RichText(
          text: TextSpan(
              children: model!.metroData!.content!.blocks!.map((e) => TextSpan(text: "${e.text}\n", style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.black87 ,fontFamily: model!.metroData!.content!.globalStyle!.fontFamily))).toList()
          ),
        ),
      );
    }
    return child;
  }
}
