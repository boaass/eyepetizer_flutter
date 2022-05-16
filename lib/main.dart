import 'package:eyepetizer/core/viewmodel/daily.dart';
import 'package:eyepetizer/core/viewmodel/follow_view_model.dart';
import 'package:eyepetizer/core/viewmodel/recommend_view_model.dart';
import 'package:flutter/material.dart';

import 'package:eyepetizer/core/router/route.dart';
import 'package:eyepetizer/ui/shared/app_theme.dart';
import 'package:eyepetizer/ui/shared/size_fit.dart';
import 'package:provider/provider.dart';

main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => ZCLRecommendViewModel()),
        ChangeNotifierProvider(create: (ctx) => ZCLFollowViewModel()),
        ChangeNotifierProvider(create: (ctx) => ZCLDailyViewModel()),
      ],
      child: MyApp()
    )
  );
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    ZCLSizeFit.initialize();
    return MaterialApp(
      // title: "eyepetizer",
      theme: ZCLAppTheme.norTheme,
      initialRoute: ZCLRouter.initialRoute,
      routes: ZCLRouter.routes,
      onUnknownRoute: ZCLRouter.unknowRoute,
    );
  }
}