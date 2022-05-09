import 'package:eyepetizer/ui/pages/community/community.dart';
import 'package:eyepetizer/ui/pages/daily/daily.dart';
import 'package:eyepetizer/ui/pages/discovery/discovery.dart';
import 'package:eyepetizer/ui/pages/focus/focus.dart';
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
    ZCLFocusPage.routeName: (ctx) => ZCLFocusPage(),
    ZCLDailyPage.routeName: (ctx) => ZCLDailyPage(),
    ZCLNotificationPage.routeName: (ctx) => ZCLNotificationPage(),
    ZCLInteractPage.routeName: (ctx) => ZCLInteractPage(),
    ZCLMessagePage.routeName: (ctx) => ZCLMessagePage()
  };

  static final RouteFactory unknowRoute = (settings) {
    return MaterialPageRoute(builder: (ctx) {
      return ZCLMainPage();
    });
  };
}