import 'package:eyepetizer/ui/pages/interact/interact.dart';
import 'package:eyepetizer/ui/pages/message/message.dart';
import 'package:eyepetizer/ui/shared/size_fit.dart';
import 'package:flutter/material.dart';
import 'package:eyepetizer/core/extention/num_extention.dart';


class ZCLNotificationPage extends StatefulWidget {

  static const String routeName = "/notification";

  const ZCLNotificationPage({Key? key}) : super(key: key);

  @override
  _ZCLNotificationPageState createState() => _ZCLNotificationPageState();
}

class _ZCLNotificationPageState extends State<ZCLNotificationPage> {
  
  List _appBarTitles = ["互动", "消息"];
  int _currentPageIndex = 0;
  double _percent = 0;
  PageController? _pageController;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
    _pageController?.addListener(_listener);
  }

  @override
  void dispose() {
    _pageController?.removeListener(_listener);
    super.dispose();
  }

  _listener() {
    final offset = _pageController?.offset;
    _percent = offset!/ZCLSizeFit.screenWidth!;
    setState(() {
      if (_percent < 0) {
        _percent = 0;
      } else if (_percent > 1) {
        _percent = 1;
      }
    });
  }

  List _pages = [
    ZCLInteractPage(),
    ZCLMessagePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: PageView.builder(
        itemCount: _pages.length,
        controller: _pageController,
        itemBuilder: (ctx, index) {
          return _pages[index];
        },
        onPageChanged: (index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
      ),
    );
  }

  final _titleWidth = 120.px;
  final _titleItemWidth = 40.px;
  _buildAppBar() {
    return AppBar(
      elevation: 0, // 隐藏阴影
      titleSpacing: 100.px,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: _titleWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _buildAppBarTitle(),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: _percent*(_titleWidth-_titleItemWidth), top: 8.px),
            child: Container(
              width: _titleItemWidth - 2.px,
              height: 1.px,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }

  _buildAppBarTitle() {
    return _appBarTitles.asMap().keys.map<Widget>((index) => _buildAppBarTitleItem(_appBarTitles[index], _currentPageIndex == index, (){
      _pageController?.animateToPage(index, duration: Duration(milliseconds: 400), curve: Curves.linear);
    })).toList();
  }

  _buildAppBarTitleItem(String title, bool isSelected, Function()? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: _titleItemWidth,
        child: Text(title, style: TextStyle(color: isSelected ? Colors.black : Colors.black54),)
      ),
    );
  }
}
