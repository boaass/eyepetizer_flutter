import 'package:flutter/material.dart';
import 'package:eyepetizer/core/model/card_model.dart';
import 'package:eyepetizer/core/extention/num_extention.dart';


class ZCLRefreshButton extends StatelessWidget {
  const ZCLRefreshButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(Icons.refresh_outlined, size: 25.px,);
  }
}
