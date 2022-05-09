import 'package:flutter/material.dart';

import 'package:eyepetizer/core/router/route.dart';
import 'package:eyepetizer/ui/shared/app_theme.dart';
import 'package:eyepetizer/ui/shared/size_fit.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    ZCLSizeFit.initialize();
    return MaterialApp(
      title: "eyepetizer",
      theme: ZCLAppTheme.norTheme,
      initialRoute: ZCLRouter.initialRoute,
      routes: ZCLRouter.routes,
      onUnknownRoute: ZCLRouter.unknowRoute,
    );
  }
}