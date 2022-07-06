import 'package:eyepetizer/core/model/card_model.dart';
import 'package:flutter/material.dart';
import 'package:eyepetizer/core/extention/num_extention.dart';


class ZCLCardSmallTitle extends StatelessWidget {
  final ZCLMetro? model;
  const ZCLCardSmallTitle({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10.px, 10, 0, 0),
      child: Text(model!.metroData!.text!, style: Theme.of(context).textTheme.headline4),
    );
  }
}
