import 'package:flutter/material.dart';
import 'package:eyepetizer/core/model/card_model.dart';
import 'package:eyepetizer/core/extention/num_extention.dart';


class ZCLFeedCoverLargeImage extends StatelessWidget {
  const ZCLFeedCoverLargeImage({Key? key, required this.model}) : super(key: key);
  final ZCLMetro? model;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.network(model!.cover!),
        ],
      ),
    );;
  }
}
