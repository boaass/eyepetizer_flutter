import 'package:eyepetizer/core/viewmodel/community_view_model.dart';
import 'package:eyepetizer/core/viewmodel/daily_view_model.dart';
import 'package:eyepetizer/core/viewmodel/follow_view_model.dart';
import 'package:eyepetizer/core/viewmodel/initial_view_model.dart';
import 'package:eyepetizer/core/viewmodel/recommend_view_model.dart';
import 'package:eyepetizer/core/viewmodel/search_recommend_view_model.dart';
import 'package:eyepetizer/core/viewmodel/topic_detail_light_view_model.dart';
import 'package:eyepetizer/core/viewmodel/topic_detail_tag_view_model.dart';
import 'package:eyepetizer/core/viewmodel/topic_detail_view_model.dart';
import 'package:eyepetizer/core/viewmodel/ugc_pic_detail_view_model.dart';
import 'package:eyepetizer/core/viewmodel/ugc_video_detail_view_model.dart';
import 'package:eyepetizer/core/viewmodel/user_center_view_model.dart';
import 'package:eyepetizer/core/viewmodel/video_detail_view_model.dart';
import 'package:flutter/material.dart';

import 'package:eyepetizer/core/router/route.dart';
import 'package:eyepetizer/ui/shared/app_theme.dart';
import 'package:eyepetizer/ui/shared/size_fit.dart';
import 'package:provider/provider.dart';

import 'core/viewmodel/discovery_view_model.dart';

main() {
  ErrorWidget.builder = (FlutterErrorDetails flutterErrorDetails) {
    print(flutterErrorDetails.toString());
    return Material(
      child: Center(
        child: Container(
          child: Text("出现错误了~"),
        ),
      ),
      // ),
    );
  };
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => ZCLInitialViewModel()),
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
            update: (ctx, notifier, topicDetailVM) => ZCLTopicDetailViewModel(Provider.of<ZCLTopicDetailNotifier>(ctx, listen: false).link)),
        ChangeNotifierProxyProvider<ZCLTopicDetailNotifier, ZCLTopicDetailTagViewModel>(
            create: (ctx) => ZCLTopicDetailTagViewModel(Provider.of<ZCLTopicDetailNotifier>(ctx, listen: false).link),
            update: (ctx, notifier, topicDetailTagVM) => ZCLTopicDetailTagViewModel(Provider.of<ZCLTopicDetailNotifier>(ctx, listen: false).link)),
        ChangeNotifierProxyProvider<ZCLTopicDetailNotifier, ZCLTopicDetailLightViewModel>(
            create: (ctx) => ZCLTopicDetailLightViewModel(Provider.of<ZCLTopicDetailNotifier>(ctx, listen: false).link),
            update: (ctx, notifier, topicDetailLightVM) => ZCLTopicDetailLightViewModel(Provider.of<ZCLTopicDetailNotifier>(ctx, listen: false).link)),
        ChangeNotifierProvider(create: (ctx) => ZCLUgcPicDetailNotifier()),
        ChangeNotifierProxyProvider<ZCLUgcPicDetailNotifier, ZCLUgcPicDetailViewModel>(
            create: (ctx) => ZCLUgcPicDetailViewModel(Provider.of<ZCLUgcPicDetailNotifier>(ctx, listen: false).id),
            update: (ctx, notifier, ugcPicDetailVM) => ZCLUgcPicDetailViewModel(Provider.of<ZCLUgcPicDetailNotifier>(ctx, listen: false).id)),
        ChangeNotifierProvider(create: (ctx) => ZCLUgcVideoDetailNotifier()),
        ChangeNotifierProxyProvider<ZCLUgcVideoDetailNotifier, ZCLUgcVideoDetailViewModel>(
            create: (ctx) => ZCLUgcVideoDetailViewModel(Provider.of<ZCLUgcVideoDetailNotifier>(ctx, listen: false).id),
            update: (ctx, notifier, ugcVideoDetailVM) => ZCLUgcVideoDetailViewModel(Provider.of<ZCLUgcVideoDetailNotifier>(ctx, listen: false).id)),
        ChangeNotifierProvider(create: (ctx) => ZCLCommunityViewModel()),
        ChangeNotifierProvider(create: (ctx) => ZCLDiscoveryViewModel()),
        ChangeNotifierProvider(create: (ctx) => ZCLSearchRecommendViewModel()),
        ChangeNotifierProvider(create: (ctx) => ZCLUserCenterNotifier()),
        ChangeNotifierProxyProvider<ZCLUserCenterNotifier, ZCLUserCenterViewModel>(
            create: (ctx) => ZCLUserCenterViewModel(Provider.of<ZCLUserCenterNotifier>(ctx, listen: false).link),
            update: (ctx, notifier, ugcPicDetailVM) => ZCLUserCenterViewModel(Provider.of<ZCLUserCenterNotifier>(ctx, listen: false).link)),
      ],
      child: MyApp()
    )
  );
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    ZCLSizeFit.initialize();
    //缓存个数 100
    PaintingBinding.instance!.imageCache!.maximumSize=100;
  //缓存大小 50m
    PaintingBinding.instance!.imageCache!.maximumSizeBytes= 50 << 20;

    return MaterialApp(
      // title: "eyepetizer",
      theme: ZCLAppTheme.norTheme,
      initialRoute: ZCLRouter.initialRoute,
      routes: ZCLRouter.routes,
      onUnknownRoute: ZCLRouter.unknowRoute,
    );
  }
}