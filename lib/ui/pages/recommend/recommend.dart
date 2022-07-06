import 'package:eyepetizer/core/viewmodel/recommend_view_model.dart';
import 'package:eyepetizer/ui/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';


class ZCLRecommendPage extends StatefulWidget {

  static const String routeName = "/recommend";

  ZCLRecommendPage({Key? key}) : super(key: key);

  @override
  _ZCLRecommendPageState createState() => _ZCLRecommendPageState();
}

class _ZCLRecommendPageState extends State<ZCLRecommendPage> {

  late ScrollController _scrollController = ScrollController(
    initialScrollOffset: Provider.of<ZCLRecommendViewModel>(context, listen: false).isBigVideoNeedShow ? 44 : 0
  );
  bool _isLoading = true;
  late ZCLRecommendViewModel _viewModel;
  double _firstItemHeight = 0;

  OverlayEntry? sticky;
  GlobalKey stickyKey = GlobalKey();

  @override
  void initState() {

    if (sticky != null) {
      sticky?.remove();
    }
    sticky = OverlayEntry(
      builder: (context) => stickyBuilder(context),
    );

    SchedulerBinding.instance!.addPostFrameCallback((_) {
      Overlay.of(context)!.insert(sticky!);
    });

    _scrollController.addListener(() {
      // print(_scrollController.position.pixels);
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        _loadMore();
      } else if (Provider.of<ZCLRecommendViewModel>(context, listen: false).isBigVideoNeedShow && _firstItemHeight != 0 && _scrollController.position.pixels >= _firstItemHeight) {
        setState(() {
          Provider.of<ZCLRecommendViewModel>(context, listen: false).isBigVideoNeedShow = false;
        });
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    sticky?.dispose();
    // _scrollController.dispose(); // 被其他控件引用时，会被其他控件 dispose()，重复 dispose() 报错

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ZCLRecommendViewModel>(
      builder: (ctx, recommendVM, child) {
        if (recommendVM.isBigVideoNeedShow && _scrollController.hasClients) {
          _scrollController.animateTo(44, duration: Duration(milliseconds: 300), curve: Curves.linear);
        }
        _viewModel = recommendVM;
        _isLoading = false;
        if (recommendVM.cardPageModel.cards == null) {
          return Container(height: 1,);
        }
        return RefreshIndicator(
          color: Colors.black,
          onRefresh: (){
            return recommendVM.update();
          },
          child: ListView.builder(
            controller: _scrollController,
            shrinkWrap: true,
            itemBuilder: (ctx, index) {
              List? metros = recommendVM.cardPageModel.cards?[index].body!.metro_list;
              if (metros == null || metros.length == 0) {
                return Container(height: 1);
              }
              if (index == 0) {
                recommendVM.cardPageModel.cards![index].body!.metro_list![0].videoPlayerAspectRatio = recommendVM.isBigVideoNeedShow?1:0;
                recommendVM.cardPageModel.cards![index].body!.metro_list![0].stickyKey = stickyKey;
                return ZCLCardWidget(model: recommendVM.cardPageModel.cards![index],);
              }
              return ZCLCardWidget(model: recommendVM.cardPageModel.cards![index],);
            },
            itemCount: recommendVM.cardPageModel.cards!.length,
          ),
        );
      }
    );
  }

  _loadMore() {
    Provider.of<ZCLRecommendViewModel>(context, listen: false).requestMoreMetros();
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

          // print("zcl --- ${box.size.height}, ${pos.dy}");
          if (_firstItemHeight == 0) {
            _firstItemHeight = box.size.height;
            sticky!.remove();
          }


          // sticky!.dispose();
          return Container();
        }
        return Container();
      },
    );
  }
}
