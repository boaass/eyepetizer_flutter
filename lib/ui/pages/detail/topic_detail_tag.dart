import 'dart:ui';

import 'package:date_format/date_format.dart';
import 'package:eyepetizer/core/model/card_model.dart';
import 'package:eyepetizer/core/model/tabinfo_model.dart';
import 'package:eyepetizer/core/model/topic_detail_tag_model.dart';
import 'package:eyepetizer/core/viewmodel/topic_detail_tag_view_model.dart';
import 'package:eyepetizer/ui/shared/size_fit.dart';
import 'package:eyepetizer/ui/widgets/detail_widgets/follow_card_video_bean_for_client.dart';
import 'package:eyepetizer/ui/widgets/detail_widgets/small_video_bean_for_client.dart';
import 'package:eyepetizer/ui/widgets/detail_widgets/ugc_picture_bean_widget.dart';
import 'package:eyepetizer/ui/widgets/detail_widgets/ugc_video_bean_widget.dart';
import 'package:eyepetizer/ui/widgets/detail_widgets/auto_play_video_bean_for_client.dart';
import 'package:eyepetizer/ui/widgets/expandable_pageview.dart';
import 'package:eyepetizer/ui/widgets/metro_widgets/card_title.dart';
import 'package:eyepetizer/ui/widgets/metro_widgets/feed_cover_small_video.dart';
import 'package:eyepetizer/ui/widgets/slider_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:eyepetizer/core/extention/num_extention.dart';


class ZCLTopicDetailTagPage extends StatefulWidget {
  const ZCLTopicDetailTagPage({Key? key}) : super(key: key);
  static const String routeName = "/topic_detail_tag";

  @override
  _ZCLTopicDetailTagPageState createState() => _ZCLTopicDetailTagPageState();
}

class _ZCLTopicDetailTagPageState extends State<ZCLTopicDetailTagPage> {

  final double appBarHeight = 80;
  ScrollController _scrollController = ScrollController();
  late PageController _pageController = PageController(initialPage: Provider.of<ZCLTopicDetailTagViewModel>(context, listen: false).initTabIndex);
  double _appBarOpacity = 0;
  late int _currentIndex = Provider.of<ZCLTopicDetailTagViewModel>(context, listen: false).initTabIndex;

  Widget? _pageViewHeader;
  bool _isPageViewHeaderShow = false;
  OverlayEntry? sticky;
  GlobalKey stickyKey = GlobalKey();
  double _pageViewHeaderPosY = 0;

  @override
  void initState() {

    if (sticky != null) {
      sticky?.remove();
    }
    sticky = OverlayEntry(builder: (ctx) => stickyBuilder(ctx));
    SchedulerBinding.instance!.addPostFrameCallback((_) {
      Overlay.of(context)!.insert(sticky!);
    });

    _scrollController.addListener(_listener);

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_listener);
    _scrollController.dispose();
    sticky!.dispose();
    super.dispose();
  }

  _listener() {
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
            _pageViewHeaderPosY = pos.dy - appBarHeight; // todo: 顶部有控件时，要把这部分高度减去
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

  @override
  Widget build(BuildContext context) {
    return Consumer<ZCLTopicDetailTagViewModel>(
      builder: (ctx, topicDetailTagVM, child) {
        return Scaffold(
          body: topicDetailTagVM.tabInfo == null || topicDetailTagVM.tabs.first == null || topicDetailTagVM.tabs.last == null ? Container() :
          Stack(
            children: [
              SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    _buildTag(topicDetailTagVM.tabInfo!),
                    _buildTab(topicDetailTagVM)
                  ],
                ),
              ),
              Column(
                children: [
                  _buildHeader(topicDetailTagVM.tabInfo!.tagInfo!.name!),
                  _isPageViewHeaderShow ? _pageViewHeader! : Container(),
                ],
              )
            ]
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: (){
              setState(() {
                _isPageViewHeaderShow = true;
              });
            },
          ),
        );
      },
    );
  }

  _buildHeader(String title) {
    return Stack(
      children: [
        Opacity(
          opacity: _appBarOpacity,
          child: Container(
            height: appBarHeight,
            color: Colors.white,
          ),
        ),
        Container(
          height: appBarHeight,
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
              Icon(Icons.upload_sharp, color: _appBarOpacity > 0.2 ? Colors.black : Colors.white)
            ],
          ),
        )
      ],
    );
  }

  _buildTag(ZCLTabInfo tabInfo) {
    return Container(
      height: 250.px,
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          Stack(
            fit: StackFit.expand,
            children: [
              Image.network(tabInfo.tagInfo!.headerImage!, fit: BoxFit.fill,),
              BackdropFilter( // 可实现高斯模糊，此处用来将原图片变暗
                filter: ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
                child: Image.network(tabInfo.tagInfo!.bgPicture!, fit: BoxFit.fill, color: Colors.black.withOpacity(0.3),),
              ),
            ]
          ),
          Positioned(
            left: 10.px,
            right: 10.px,
            bottom: 20.px,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(tabInfo.tagInfo!.name!, style: Theme.of(context).textTheme.headline1!.copyWith(color: Colors.white, fontWeight: FontWeight.bold),),
                  tabInfo.tagInfo!.description == null || tabInfo.tagInfo!.description!.isEmpty ? Container() :
                  Padding(
                    padding: EdgeInsets.only(top: 15.px),
                    child: Text(
                      tabInfo.tagInfo!.description ?? "",
                      style: Theme.of(context).textTheme.headline3!.copyWith(color: Colors.white),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15.px),
                    child: Text("${tabInfo.tagInfo!.tagFollowCount} 人关注|${tabInfo.tagInfo!.lookCount} 人参与", style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white)),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15.px),
                    padding: EdgeInsets.fromLTRB(10.px, 2.px, 10.px, 2.px),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(5.px))
                    ),
                    child: tabInfo.tagInfo!.follow!.followed! ? Text("已关注") : Text("+关注", style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white),),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _buildTabBar(ZCLTopicDetailTagViewModel viewModel) {
    if (_pageViewHeader != null) return _pageViewHeader;
    _pageViewHeader =
        Container(
          width: ZCLSizeFit.screenWidth,
          color: Colors.white,
          child: ZCLSliderAppBar(
            pageController: _pageController,
            titleWidth: ZCLSizeFit.screenWidth! - 200,
            appBarTitles: viewModel.tabInfo!.tabInfo!.tabList!.map((e) => e.name!).toList()
          ),
        );
    return _pageViewHeader;
  }

  _buildTab(ZCLTopicDetailTagViewModel viewModel) {
    return Column(
      key: stickyKey,
      children: [
        _buildTabBar(viewModel),
        MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: ExpandablePageView(
            controller: _pageController,
            onPageChanged: (index) {
              // setState(() {
                _currentIndex = index;
              // });
            },
            itemCount: viewModel.tabs.length,
            itemBuilder: (ctx, index) {
              return _buildTabPage(viewModel.tabs[index]);
              // return Container(color: index == 0 ? Colors.red : Colors.blue);
            }
          ),
        ),
      ],
    );
  }

  _buildTabPage(ZCLTopicDetailTagModel? tags) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: tags!.itemList!.length,
      itemBuilder: (ctx, index) {
        return Container(
          child: _buildPageItem(tags.itemList![index]),
        );
      }
    );
  }

  _buildPageItem(ItemList item) {
    Widget widget = Container();
    
    if (item.type == ItemListType.TEXT_CARD) {
      final metro = ZCLMetro(text: item.data!.text!);
      widget = ZCLCardTitle(model: metro);
    } else if (item.type == ItemListType.FOLLOW_CARD) {
      if (item.data!.dataType == ItemListDataType.FOLLOW_CARD) {
        if (item.data!.content!.type == ContentType.VIDEO) {
          if (item.data!.content!.data!.dataType == ContentDataType.VIDEO_BEAN_FOR_CLIENT) {
            widget = ZCLFollowCardVideoBeanForClientWidget(item: item);
          }
        }
      }
    } else if (item.type == ItemListType.VIDEO_SMALL_CARD) {
      if (item.data!.dataType == ItemListDataType.VIDEO_BEAN_FOR_CLIENT) {
        widget = ZCLSmallVideoBeanForClient(item: item);
      }
    } else if (item.type == ItemListType.PICTURE_FOLLOW_CARD) {
      if (item.data!.dataType == ItemListDataType.FOLLOW_CARD) {
        if (item.data!.content!.type == ContentType.UGC_PICTURE) {
          if (item.data!.content!.data!.dataType ==
              ContentDataType.UGC_PICTURE_BEAN) {
            widget = ZCLUGCPictureBeanWidget(item: item);
          }
        }
      }
    } else if (item.type == ItemListType.AUTO_PLAY_FOLLOW_CARD) {
      if (item.data!.dataType == ItemListDataType.FOLLOW_CARD) {
        if (item.data!.content!.type == ContentType.VIDEO) {
          if (item.data!.content!.data!.dataType == ContentDataType.UGC_VIDEO_BEAN) {
            widget = ZCLUGCVideoBeanWidget(item: item);
          } else if (item.data!.content!.data!.dataType == ContentDataType.VIDEO_BEAN_FOR_CLIENT) {
            widget = ZCLAutoPlayVideoBeanForClientWidget(item: item);
          }
        }
      }
    }

    return widget;
  }

  _loadMore() {
    Provider.of<ZCLTopicDetailTagViewModel>(context, listen: false).loadMore(_currentIndex);
  }
}
