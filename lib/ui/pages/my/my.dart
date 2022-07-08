import 'package:flutter/material.dart';


class ZCLMyPage extends StatelessWidget {

  static const String routeName = "/my";

  const ZCLMyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Text("我的")
      )
    );
  }
}
