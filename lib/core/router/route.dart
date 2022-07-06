import 'package:eyepetizer/ui/pages/community/community.dart';
import 'package:eyepetizer/ui/pages/daily/daily.dart';
import 'package:eyepetizer/ui/pages/detail/search.dart';
import 'package:eyepetizer/ui/pages/detail/topic_detail_light.dart';
import 'package:eyepetizer/ui/pages/detail/topic_detail_tag.dart';
import 'package:eyepetizer/ui/pages/detail/topic_detail.dart';
import 'package:eyepetizer/ui/pages/detail/ugc_pic_detail.dart';
import 'package:eyepetizer/ui/pages/detail/ugc_video_detail.dart';
import 'package:eyepetizer/ui/pages/detail/user_center.dart';
import 'package:eyepetizer/ui/pages/detail/video_detail.dart';
import 'package:eyepetizer/ui/pages/discovery/discovery.dart';
import 'package:eyepetizer/ui/pages/follow/follow.dart';
import 'package:eyepetizer/ui/pages/home/home.dart';
import 'package:eyepetizer/ui/pages/interact/interact.dart';
import 'package:eyepetizer/ui/pages/main/main.dart';
import 'package:eyepetizer/ui/pages/message/message.dart';
import 'package:eyepetizer/ui/pages/my/my.dart';
import 'package:eyepetizer/ui/pages/notification/notification.dart';
import 'package:eyepetizer/ui/pages/recommend/recommend.dart';
import 'package:flutter/material.dart';


class ZCLRouter {
  static final String initialRoute = ZCLMainPage.routeName;

  static final Map<String, WidgetBuilder> routes = {
    ZCLHomePage.routeName: (ctx) => ZCLHomePage(),
    ZCLCommunityPage.routeName: (ctx) => ZCLCommunityPage(),
    ZCLDiscoveryPage.routeName: (ctx) => ZCLDiscoveryPage(),
    ZCLMyPage.routeName: (ctx) => ZCLMyPage(),
    ZCLRecommendPage.routeName: (ctx) => ZCLRecommendPage(),
    ZCLFollowPage.routeName: (ctx) => ZCLFollowPage(),
    ZCLDailyPage.routeName: (ctx) => ZCLDailyPage(),
    ZCLNotificationPage.routeName: (ctx) => ZCLNotificationPage(),
    ZCLInteractPage.routeName: (ctx) => ZCLInteractPage(),
    ZCLMessagePage.routeName: (ctx) => ZCLMessagePage(),
    ZCLVideoDetailPage.routeName: (ctx) => ZCLVideoDetailPage(),
    ZCLTopicDetailPage.routeName: (ctx) => ZCLTopicDetailPage(),
    ZCLTopicDetailTagPage.routeName: (ctx) => ZCLTopicDetailTagPage(),
    ZCLTopicDetailLightPage.routeName: (ctx) => ZCLTopicDetailLightPage(),
    ZCLUgcPicDetailPage.routeName: (ctx) => ZCLUgcPicDetailPage(),
    ZCLUgcVideoDetailPage.routeName: (ctx) => ZCLUgcVideoDetailPage(),
    ZCLSearchPage.routeName: (ctx) => ZCLSearchPage(),
    ZCLUserCenterPage.routeName: (ctx) => ZCLUserCenterPage()
  };

  static final RouteFactory unknowRoute = (settings) {
    return MaterialPageRoute(builder: (ctx) {
      return ZCLMainPage();
    });
  };
}