import 'package:eyepetizer/core/viewmodel/topic_detail_view_model.dart';
import 'package:eyepetizer/ui/shared/size_fit.dart';
import 'package:eyepetizer/ui/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:eyepetizer/core/extention/num_extention.dart';


class ZCLTopicDetailPage extends StatefulWidget {

  static const String routeName = "/topic_detail";

  const ZCLTopicDetailPage({Key? key}) : super(key: key);

  @override
  _ZCLTopicDetailPageState createState() => _ZCLTopicDetailPageState();
}

class _ZCLTopicDetailPageState extends State<ZCLTopicDetailPage> {

  final ScrollController _scrollController = ScrollController();
  double _opacity = 0;
  double _navBarInitPosY = 0;
  bool _isOnlyNavShow = false;
  int _currentNavIndex = 0;

  OverlayEntry? sticky;
  GlobalKey stickyKey = GlobalKey();

  @override
  void initState() {

    if (sticky != null) {
      sticky?.remove();
    }
    sticky = OverlayEntry(builder: (ctx) => stickyBuilder(ctx));
    SchedulerBinding.instance!.addPostFrameCallback((_) {
      Overlay.of(context)!.insert(sticky!);
    });

    _scrollController.addListener(() {
      // print("offset: ${_scrollController.offset} --- ${_scrollController.position.userScrollDirection}");
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        _reloadMoreItem();
      }

      if (!_isOnlyNavShow &&
          _navBarInitPosY != 0 &&
          (_scrollController.offset >= (_navBarInitPosY - 100)) &&
          _scrollController.position.userScrollDirection == ScrollDirection.reverse) {
        // 滑动到 navbar 位置
        _ChangePage(true);
      }

      if (!_isOnlyNavShow) {
        double opacity = _scrollController.offset / 100;
        setState(() {
          _opacity = opacity > 1 ? 1 : opacity < 0 ? 0 : opacity;
        });
      } else {
        setState(() {
          _opacity = 1;
        });
      }

    });
    super.initState();
  }

  _ChangePage(bool showNav) {
    if (showNav) {
      Provider.of<ZCLTopicDetailViewModel>(context, listen: false).updateDetailModelToNavModel();
      _scrollController.jumpTo(0);
    } else {
      Provider.of<ZCLTopicDetailViewModel>(context, listen: false).updateDetailModelToOriginModel();

      // todo: jumpTo(0)或animateTo(0)都不能到顶，猜测是由于更换model导致ListView高度计算没有及时刷新
      // _scrollController.animateTo(0, duration: Duration(milliseconds: 300), curve: Curves.linear);
      _scrollController.jumpTo(-ZCLSizeFit.screenHeight!);
    }
    setState(() {
      _isOnlyNavShow = showNav;
      _opacity = showNav ? 1 : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ZCLTopicDetailViewModel>(
      builder: (ctx, topicDetailVM, child) {
        return Scaffold(
          body: (null == topicDetailVM || topicDetailVM.cardPageModel == null) ? Container() :
          Stack(
            children: [
              ListView.builder(
                  padding: _isOnlyNavShow ? EdgeInsets.only(top: 100) : EdgeInsets.zero,
                  controller: _scrollController,
                  itemCount: topicDetailVM.cardPageModel!.cards!.length + 1,
                  itemBuilder: (ctx, index) {
                    if (!_isOnlyNavShow && index == 2) {
                      topicDetailVM.cardPageModel!.cards![index].body!.metro_list![0].stickyKey = stickyKey;
                    }
                    if (index == topicDetailVM.cardPageModel!.cards!.length) {
                      return Container(
                        margin: EdgeInsets.only(top: 20.px),
                        alignment: Alignment.center,
                        child: (topicDetailVM.cardPageModel!.cards!.last.body!.apiRequest != null) ? Icon(Icons.cached, color: Colors.black,) : Text("-The End-", style: Theme.of(context).textTheme.headline3!.copyWith(fontFamily: "Lobster"),),
                      );
                    }
                    return ZCLCardWidget(model: topicDetailVM.cardPageModel!.cards![index], onTap: (navIndex) {
                      if (!_isOnlyNavShow) {
                        _ChangePage(true);
                      }
                      topicDetailVM.requestNavItemModel(navIndex);
                      _currentNavIndex = navIndex;
                    }, navIndex: _currentNavIndex,);
                  }
              ),
              Opacity(
                opacity: _opacity,
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.fromLTRB(10.px, 44, 10.px, 0),
                  height: 100,
                  width: ZCLSizeFit.screenWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: (){
                          if (_isOnlyNavShow) {
                            _ChangePage(false);
                          } else {
                            Navigator.of(context).maybePop();
                          }
                        },
                        child: Icon(Icons.arrow_back_ios_outlined)
                      ),
                      Expanded(child: Text(_isOnlyNavShow ? topicDetailVM.cardPageModel?.pageInfo?.title ?? "" : "", style: Theme.of(context).textTheme.headline3!.copyWith(fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis,)),
                      Icon(Icons.share_outlined)
                    ],
                  ),
                ),
              )
            ],
          ),
          floatingActionButton: (null == topicDetailVM || topicDetailVM.cardPageModel == null) ? Container() :
          FloatingActionButton(
            onPressed: () {

            },
            child: Image.network(topicDetailVM.cardPageModel!.floatEntrances!.first.image!.url!),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        );
      },
    );
  }

  _reloadMoreItem() {
    Provider.of<ZCLTopicDetailViewModel>(context, listen: false).requestMoreNavItem();
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

          if (_navBarInitPosY == 0) {
            _navBarInitPosY = pos.dy;
          }
          // print("zcl --- ${box.size.height}, ${pos.dy}");

          // sticky!.dispose();
          return Container();
        }
        return Container();
      },
    );
  }
}
