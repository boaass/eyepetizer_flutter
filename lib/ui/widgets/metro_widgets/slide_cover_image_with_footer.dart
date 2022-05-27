import 'package:flutter/material.dart';
import 'package:eyepetizer/core/model/card_model.dart';
import 'package:eyepetizer/core/extention/num_extention.dart';


class ZCLSlideCoverImageWithFooter extends StatelessWidget {
  const ZCLSlideCoverImageWithFooter({Key? key, required this.model}) : super(key: key);
  final ZCLMetro? model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(2.px, 0, 2.px, 0),
      child: Image.network(model!.cover!),
    );
  }
}
