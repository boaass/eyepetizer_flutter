import 'package:eyepetizer/core/model/card_model.dart';
import 'package:flutter/material.dart';


class ZCLDescriptionText extends StatelessWidget {
  final ZCLMetro? model;
  const ZCLDescriptionText({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Text(model!.metroData!.text!, style: Theme.of(context).textTheme.headline4),
        ),
        Container(height: 1, color: Colors.black26)
      ],
    );
  }
}
