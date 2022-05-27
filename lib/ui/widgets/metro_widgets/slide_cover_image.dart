import 'package:flutter/material.dart';
import 'package:eyepetizer/core/model/card_model.dart';
import 'package:eyepetizer/core/extention/num_extention.dart';


class ZCLSlideCoverImage extends StatelessWidget {
  const ZCLSlideCoverImage({Key? key, required this.model}) : super(key: key);
  final ZCLMetro? model;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 10.px),
        child: Image.network(model!.cover!)
    );
  }
}
