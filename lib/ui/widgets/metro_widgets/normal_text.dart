import 'package:flutter/material.dart';
import 'package:eyepetizer/core/model/card_model.dart';
import 'package:eyepetizer/core/extention/num_extention.dart';

class ZCLNormalText extends StatelessWidget {
  const ZCLNormalText({Key? key, required this.model}) : super(key: key);
  final ZCLMetro? model;

  @override
  Widget build(BuildContext context) {
    return Text(model!.text!, style: Theme.of(context).textTheme.headline4!);
  }
}
