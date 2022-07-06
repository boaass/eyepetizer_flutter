import 'package:eyepetizer/core/model/card_model.dart';
import 'package:flutter/material.dart';


class ZCLTitleLink extends StatelessWidget {
  final ZCLMetro? model;
  const ZCLTitleLink({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text(model!.metroData!.text!, style: Theme.of(context).textTheme.headline3,),
          Icon(Icons.chevron_right)
        ],
      ),
    );
  }
}
