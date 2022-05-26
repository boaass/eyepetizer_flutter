import 'package:eyepetizer/core/viewmodel/daily.dart';
import 'package:eyepetizer/core/viewmodel/follow_view_model.dart';
import 'package:eyepetizer/core/viewmodel/recommend_view_model.dart';
import 'package:eyepetizer/core/viewmodel/topic_detail_view_model.dart';
import 'package:eyepetizer/core/viewmodel/video_detail_view_model.dart';
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
        ChangeNotifierProvider(create: (ctx) => ZCLVideoDetailNotifier()),
        ChangeNotifierProxyProvider<ZCLVideoDetailNotifier, ZCLVideoDetailViewModel>(
            create: (ctx) => ZCLVideoDetailViewModel(Provider.of<ZCLVideoDetailNotifier>(ctx, listen: false).videoId),
            update: (ctx, notifier, videoDetailVM) => ZCLVideoDetailViewModel(Provider.of<ZCLVideoDetailNotifier>(ctx, listen: false).videoId)),
        ChangeNotifierProvider(create: (ctx) => ZCLTopicDetailNotifier()),
        ChangeNotifierProxyProvider<ZCLTopicDetailNotifier, ZCLTopicDetailViewModel>(
            create: (ctx) => ZCLTopicDetailViewModel(Provider.of<ZCLTopicDetailNotifier>(ctx, listen: false).link),
            update: (ctx, notifier, topicDetailVM) => ZCLTopicDetailViewModel(Provider.of<ZCLTopicDetailNotifier>(ctx, listen: false).link))
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