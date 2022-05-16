import 'package:eyepetizer/core/viewmodel/recommend_view_model.dart';
import 'package:eyepetizer/ui/pages/daily/daily.dart';
import 'package:eyepetizer/ui/pages/follow/follow.dart';
import 'package:eyepetizer/ui/pages/notification/notification.dart';
import 'package:eyepetizer/ui/pages/recommend/recommend.dart';
import 'package:eyepetizer/ui/shared/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:eyepetizer/core/extention/num_extention.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';


class ZCLHomePage extends StatefulWidget {

  static const String routeName = "/home";

  const ZCLHomePage({Key? key}) : super(key: key);

  @override
  _ZCLHomePageState createState() => _ZCLHomePageState();
}

class _ZCLHomePageState extends State<ZCLHomePage> {

  int _currentPageIndex = 0;
  List _appBarTitle = ["推荐", "关注", "日报"];
  PageController? _pageController;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Consumer<ZCLRecommendViewModel>(
      builder: (ctx, vm, child) {
        return Scaffold(
          appBar: vm.isBigVideoNeedShow ? null : _buildAppBar(),
          body: PageView(
            controller: _pageController,
            children: [
              ZCLRecommendPage(),
              ZCLFollowPage(),
              ZCLDailyPage()
            ],
            onPageChanged: (index) {
              setState(() {
                vm.isBigVideoNeedShow = false;
                _currentPageIndex = index;
              });
            },

          ),
        );
      }
    );
  }

  _buildAppBar() {
    return AppBar(
      toolbarOpacity: 1,
      leading: Container(
        padding: EdgeInsets.only(left: 8.px),
        alignment: Alignment.center,
        child: Text("eyepetizer", style: ZCLAppTheme.titleFontStyle.copyWith(fontSize: 16.px),)
      ),
      leadingWidth: 90.px,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _buildAppBarTitle(),
      ),
      centerTitle: true,
      titleSpacing: 40.px,
      actions: [
        Padding(
          padding: EdgeInsets.all(8.px),
          child: GestureDetector(
            onTap: (){
              Navigator.of(context).pushNamed(ZCLNotificationPage.routeName);
            },
            child: Icon(Icons.notifications_none_outlined, size: 30.px,)
          ),
        )
      ],
    );
  }

  _buildAppBarTitle() {
    return _appBarTitle.asMap().keys.map<Widget>((index) => _buildAppBarTitleItem(_appBarTitle[index], _currentPageIndex == index, (){
      // _pageController.animateToPage(index, duration: Duration(milliseconds: 200), curve: Curves.linear);
      _pageController?.jumpToPage(index);
    })).toList();
  }

  _buildAppBarTitleItem(String title, bool isSelected, Function()? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          isSelected ? Icon(Icons.circle, size: 10.px, color: Colors.purple,) : Container(width: 10.px,),
          Text(title, style: Theme.of(context).textTheme.headline3,)
        ],
      ),
    );
  }
}
