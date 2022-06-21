import 'package:eyepetizer/core/model/card_model.dart';
import 'package:flutter/material.dart';
import 'package:eyepetizer/core/extention/num_extention.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';


class ZCLDefaultWeb extends StatefulWidget {
  final ZCLMetro model;
  const ZCLDefaultWeb({Key? key, required this.model}) : super(key: key);

  @override
  _ZCLDefaultWebState createState() => _ZCLDefaultWebState();
}

class _ZCLDefaultWebState extends State<ZCLDefaultWeb> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.px,
      margin: EdgeInsets.only(top: 10.px),
      child: InAppWebView(
        initialUrl: widget.model.metroData!.url,
        androidOnPermissionRequest: (controller, origin, resources) async {
          return PermissionRequestResponse(
            resources: resources,
            action: PermissionRequestResponseAction.GRANT);
        },
      ),
    );
  }
}
