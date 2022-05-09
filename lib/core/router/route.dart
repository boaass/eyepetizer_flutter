import 'package:eyepetizer/ui/pages/community/community.dart';
import 'package:eyepetizer/ui/pages/discovery/discovery.dart';
import 'package:eyepetizer/ui/pages/home/home.dart';
import 'package:eyepetizer/ui/pages/main/main.dart';
import 'package:eyepetizer/ui/pages/my/my.dart';
import 'package:flutter/material.dart';


class ZCLRouter {
  static final String initialRoute = ZCLMainPage.routeName;

  static final Map<String, WidgetBuilder> routes = {
    ZCLHomePage.routeName: (ctx) => ZCLHomePage(),
    ZCLCommunityPage.routeName: (ctx) => ZCLCommunityPage(),
    ZCLDiscoveryPage.routeName: (ctx) => ZCLDiscoveryPage(),
    ZCLMyPage.routeName: (ctx) => ZCLMyPage()
  };

  static final RouteFactory unknowRoute = (settings) {
    return MaterialPageRoute(builder: (ctx) {
      return ZCLMainPage();
    });
  };
}