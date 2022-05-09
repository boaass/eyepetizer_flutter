import 'package:flutter/material.dart';

import 'package:eyepetizer/ui/pages/home/home.dart';
import 'package:eyepetizer/ui/pages/community/community.dart';
import 'package:eyepetizer/ui/pages/discovery/discovery.dart';
import 'package:eyepetizer/ui/pages/my/my.dart';



final List<Widget> pages = [
  ZCLHomePage(),
  ZCLCommunityPage(),
  ZCLDiscoveryPage(),
  ZCLMyPage()
];

final List<BottomNavigationBarItem> items = [
  BottomNavigationBarItem(icon: Icon(Icons.home_outlined, color: Colors.black,), label: ""),
  BottomNavigationBarItem(icon: Icon(Icons.mode_comment_outlined, color: Colors.black), label: "社区"),
  BottomNavigationBarItem(icon: Icon(Icons.search_outlined, color: Colors.black), label: "发现"),
  BottomNavigationBarItem(icon: Icon(Icons.tag_faces_outlined, color: Colors.black), label: "我的")
];