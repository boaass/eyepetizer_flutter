import 'package:eyepetizer/core/model/card_model.dart';
import 'package:flutter/material.dart';

class ZCLMoreLink extends StatelessWidget {
  const ZCLMoreLink({Key? key, required this.model}) : super(key: key);
  final ZCLMetro model;

  Widget build(BuildContext context) {
    return Container(
      child: Icon(Icons.arrow_right_alt_outlined),
    );
  }
}
