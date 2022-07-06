import 'package:eyepetizer/core/model/card_model.dart';
import 'package:eyepetizer/core/model/card_page_model.dart';
import 'package:eyepetizer/core/model/user_info.dart';
import 'package:eyepetizer/core/viewmodel/user_center_view_model.dart';
import 'package:eyepetizer/ui/shared/size_fit.dart';
import 'package:eyepetizer/ui/widgets/card_widget.dart';
import 'package:eyepetizer/ui/widgets/expandable_pageview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:eyepetizer/core/extention/num_extention.dart';


class ZCLUserCenterPage extends StatefulWidget {
  static const routeName = "/userCenter";
  const ZCLUserCenterPage({Key? key}) : super(key: key);

  @override
  _ZCLUserCenterPageState createState() => _ZCLUserCenterPageState();
}

class _ZCLUserCenterPageState extends State<ZCLUserCenterPage> with TickerProviderStateMixin {

  TabController? _tabController;
  PageController? _pageController;
  ScrollController _scrollController = ScrollController();
  int _currentPageIndex = 0;

  OverlayEntry? sticky;
  GlobalKey stickyKey = GlobalKey();
  double _pageViewHeaderPosY = 0;
  bool _isPageViewHeaderShow = false;
  Widget? _pageViewHeader;
  final double _appBarHeight = 100;
  double _appBarOpacity = 0;
  Map<String, dynamic> tabBars = {
    "index": Icon(Icons.home_filled),
    "work" : Icon(Icons.dashboard_rounded),
    "album": Icon(Icons.video_library_rounded)
  };

  @override
  void initState() {
    _pageController = PageController(initialPage: _currentPageIndex);

    _scrollController.addListener(() {

      double opacity = _scrollController.offset / 100;
      setState(() {
        _appBarOpacity = opacity > 1 ? 1 : opacity < 0 ? 0 : opacity;
      });

      if (!_isPageViewHeaderShow && _pageViewHeaderPosY != 0 && _scrollController.offset >= _pageViewHeaderPosY && _scrollController.position.userScrollDirection == ScrollDirection.reverse) {
        setState(() {
          _isPageViewHeaderShow = true;
        });
      } else if (_isPageViewHeaderShow && _pageViewHeaderPosY != 0 && _scrollController.offset <= _pageViewHeaderPosY && _scrollController.position.userScrollDirection == ScrollDirection.forward) {
        setState(() {
          _isPageViewHeaderShow = false;
        });
      }
      if (_scrollController.offset == _scrollController.position.maxScrollExtent) {
        _loadMore();
      }
    });

    if (sticky != null) {
      sticky?.remove();
    }
    sticky = OverlayEntry(builder: (ctx) => stickyBuilder(ctx));
    SchedulerBinding.instance!.addPostFrameCallback((_) {
      Overlay.of(context)!.insert(sticky!);
    });

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _tabController?.dispose();
    // _pageController?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Consumer<ZCLUserCenterViewModel>(
        builder: (ctx, userCenterVM, child) {
          if (_tabController == null && userCenterVM.authorUserInfo != null) {
            _tabController = TabController(initialIndex: _currentPageIndex, vsync: this, length: userCenterVM.authorUserInfo!.navTabs!.navList!.length);
          }
          return userCenterVM.authorUserInfo == null || userCenterVM.pageModels!.map((e) => e.cards == null).contains(true) ? Container() :
          Stack(
            children: [
              RefreshIndicator(
                color: Colors.black,
                onRefresh: () {
                  return userCenterVM.refresh(userCenterVM.authorUserInfo!.uid!.toString());
                },
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Container(
                    child: Column(
                      children: [
                        _buildUserInfo(userCenterVM.authorUserInfo!),
                        _buildContent(userCenterVM),
                      ],
                    )
                  ),
                ),
              ),
              Column(
                children: [
                  _buildHeader(ctx, userCenterVM.authorUserInfo!.nick!),
                  _isPageViewHeaderShow ? Container(color: Colors.white, child: _pageViewHeader!) : Container(),
                ],
              )
            ]
          );
        },
      ),
    );
  }

  _buildHeader(BuildContext ctx, String title) {
    return Stack(
      children: [
        Opacity(
          opacity: _appBarOpacity,
          child: Container(
            height: _appBarHeight,
            color: Colors.white,
          ),
        ),
        Container(
          height: _appBarHeight,
          padding: EdgeInsets.fromLTRB(10.px, 44, 10.px, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: (){
                    Navigator.of(context).maybePop();
                  },
                  child: Icon(Icons.arrow_back_ios_outlined, color: _appBarOpacity > 0.2 ? Colors.black : Colors.white,)
              ),
              Expanded(
                child: Opacity(
                  opacity: _appBarOpacity,
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline3!.copyWith(fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Row(
                children: [
                  _appBarOpacity > 0.2 ? Icon(Icons.person_add_alt_1) : Container(),
                  SizedBox(width: 20.px,),
                  Icon(Icons.open_in_new_outlined, color: _appBarOpacity > 0.2 ? Colors.black : Colors.white)
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  _buildContent(ZCLUserCenterViewModel userCenterVM) {
    return Column(
      key: stickyKey,
      children: [
        _buildTabBar(userCenterVM.authorUserInfo!),
        _buildPageContent(userCenterVM),
      ],
    );
  }

  _buildUserInfo(AuthorUserInfo authorUserInfo) {
    return Container(
      height: 400.px,
      color: Colors.white,
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.topLeft,
        children: [
          Container(
            child: Column(
              children: [
                Row(children: [Expanded(child: Image.network(authorUserInfo.cover!, height: 160.px, fit: BoxFit.fill))]),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(10.px, 80.px, 10.px, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(authorUserInfo.nick!, style: Theme.of(context).textTheme.headline3!.copyWith(fontWeight: FontWeight.bold)),
                        Expanded(
                          child: Text(
                            authorUserInfo.description!,
                            style: Theme.of(context).textTheme.headline4!,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(top: 10.px),
                            child: Row(
                              children: [
                                Text("${authorUserInfo.fansCount}", style: Theme.of(context).textTheme.headline4),
                                Text("粉丝", style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.black54)),
                                SizedBox(width: 20.px),
                                Text("${authorUserInfo.followCount}", style: Theme.of(context).textTheme.headline4),
                                Text("关注", style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.black54)),
                                SizedBox(width: 20.px),
                                Text("${authorUserInfo.featuredCount}", style: Theme.of(context).textTheme.headline4),
                                Text("徽章", style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.black54))
                              ],
                            )
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10.px),
                          alignment: Alignment.centerLeft,
                          child: Text(authorUserInfo.brief ?? "", style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.black54)),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10.px),
                          height: 2.px,
                          color: Colors.black12,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 130.px,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.px),
              width: ZCLSizeFit.screenWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    clipBehavior: Clip.hardEdge,
                    width: 80.px,
                    height: 80.px,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40.px)
                    ),
                    child: Image.network(authorUserInfo.avatar!.url!, fit: BoxFit.fill,),
                  ),
                  // Spacer(),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(5.px),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black54)
                        ),
                        child: Icon(Icons.mail_outline, size: 15)
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5.px),
                        color: Colors.black,
                        padding: EdgeInsets.fromLTRB(30.px, 5.px, 30.px, 5.px),
                        child: Icon(Icons.add, color: Colors.white)
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ]
      ),
    );
  }

  _buildTabBar(AuthorUserInfo authorUserInfo) {
    if (_pageViewHeader != null) return _pageViewHeader;
    _pageViewHeader = Container(
      margin: EdgeInsets.only(top: 10.px),
      child: Theme(
        data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent
        ),
        child: TabBar(
            controller: _tabController,
            unselectedLabelColor: Colors.black26,
            labelColor: Colors.black,
            indicatorColor: Colors.transparent,
            onTap: (index) {
              setState(() {
                _currentPageIndex = index;
              });
              _pageController!.jumpToPage(_currentPageIndex);
            },
            tabs: authorUserInfo.navTabs!.navList!.map<Widget>((e) => tabBars[e.iconType]).toList()
        ),
      ),
    );
    return _pageViewHeader;
  }

  _buildPageContent(ZCLUserCenterViewModel userCenterVM) {
    if (_pageController == null || !_pageController!.hasClients) {
      _pageController = PageController(initialPage: _currentPageIndex);
    }
    ZCLCardPageModel? model = userCenterVM.pageModels![_currentPageIndex];
    return ExpandablePageView(
      controller: _pageController,
      onPageChanged: (index) {
        setState(() {
          _currentPageIndex = index;
        });
        _tabController!.index = index;
      },
      itemCount: userCenterVM.pageModels!.length,
      itemBuilder: (ctx, index) {
        return MediaQuery.removePadding(
          context: ctx,
          removeTop: true,
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: model.cards!.length + 1,
            itemBuilder: (ctx, index) {
              if (index == model.cards!.length) {
                return model.cards!.last.body!.apiRequest != null ? Container() :
                _buildFooter();
              }
              return ZCLCardWidget(model: model.cards![index]);
            }
          ),
        );
      }
    );
  }

  _buildFooter() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.px),
      alignment: Alignment.center,
      child: Text("-The End-", style: Theme.of(context).textTheme.headline3!.copyWith(fontFamily: "Lobster"),),
    );
  }

  // 获取列表第一个元素的位置
  Widget stickyBuilder(BuildContext context) {
    return AnimatedBuilder(
      animation: _scrollController,
      builder: (_, Widget? child) {
        final keyContext = stickyKey.currentContext;
        if (keyContext != null) {
          // widget is visible
          final box = keyContext.findRenderObject() as RenderBox;
          final pos = box.localToGlobal(Offset.zero);

          if (_pageViewHeaderPosY == 0) {
            _pageViewHeaderPosY = pos.dy - _appBarHeight;
            sticky!.remove();
          }
          // print("zcl --- ${box.size.height}, ${pos.dy}");

          // sticky!.dispose();
          return Container();
        }
        return Container();
      },
    );
  }

  _loadMore() {
    Provider.of<ZCLUserCenterViewModel>(context, listen: false).loadMore(_currentPageIndex);
  }
}
