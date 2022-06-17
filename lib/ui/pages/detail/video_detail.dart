import 'package:eyepetizer/core/model/topic_detail_tag_model.dart';
import 'package:eyepetizer/core/model/video_bean_model.dart';
import 'package:eyepetizer/core/model/video_related_model.dart';
import 'package:eyepetizer/core/model/video_replies_model.dart';
import 'package:eyepetizer/core/viewmodel/video_detail_view_model.dart';
import 'package:eyepetizer/ui/widgets/kaiyan_chewiedvideo_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:eyepetizer/core/extention/num_extention.dart';
import 'package:date_format/date_format.dart';
import 'package:eyepetizer/core/extention/num_extention.dart';


class ZCLVideoDetailPage extends StatefulWidget {

  static const String routeName = "/video_detail";

  const ZCLVideoDetailPage({Key? key}) : super(key: key);

  @override
  _ZCLVideoDetailPageState createState() => _ZCLVideoDetailPageState();
}

class _ZCLVideoDetailPageState extends State<ZCLVideoDetailPage> {

  ScrollController _scrollController = ScrollController();
  //顶部偏移量
  double _topMargin = 0;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        _loadMoreReply();
        return;
      }
      if (_scrollController.position.pixels < 0) {
        setState(() {
          _topMargin = -_scrollController.position.pixels;
        });
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ZCLVideoDetailViewModel>(
        builder: (ctx, videoDetailVM, child) {
          return (videoDetailVM.videoBeanModel == null || videoDetailVM.videoRelatedModel == null || videoDetailVM.videoReplyModel == null) ?
          Container() :
          SafeArea(
            child: Container( // 背景颜色渐变
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black87, Colors.black54],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight
                )
              ),
              child: Column(
                children: [
                  KYChewieVideoWidget(playUrl: (videoDetailVM.videoBeanModel!.playInfo != null && videoDetailVM.videoBeanModel!.playInfo!.length != 0) ? videoDetailVM.videoBeanModel!.playInfo!.first.url! : (videoDetailVM.videoBeanModel!.playUrl ?? "")),
                  _buildListViewTitle(_topMargin),
                  Expanded( // 解决 ListView 滚动范围问题
                    child: Listener(
                      onPointerUp: _onPointerUp,
                      child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        controller: _scrollController,
                        shrinkWrap: true,
                        itemCount: 2 + (videoDetailVM.videoRelatedModel!.itemList?.length ?? 0) + (videoDetailVM.videoReplyModel!.itemList?.length ?? 0) + 1,
                        itemBuilder: (ctx, index) {
                          if (index == 0) {
                            return _buildVideoDetailContent(videoDetailVM);
                          } else if (index == 1) {
                            return _buildAuthorItem(videoDetailVM);
                          } else if (index >= 2 && index < (videoDetailVM.videoRelatedModel!.itemList?.length ?? 0) + 2) {
                            return _buildSmallVideoItem(videoDetailVM.videoRelatedModel!.itemList![index-2]);
                          }  else if ((index >= (videoDetailVM.videoRelatedModel!.itemList?.length ?? 0) + 2) && (index < (videoDetailVM.videoRelatedModel!.itemList?.length ?? 0) + 2 + (videoDetailVM.videoReplyModel!.itemList?.length ?? 0))) {
                            return _buildReplyItem(videoDetailVM.videoReplyModel!.itemList![index - (videoDetailVM.videoRelatedModel!.itemList?.length ?? 0) - 2]);
                          } else {
                            return (videoDetailVM.videoReplyModel?.nextPageUrl != null && videoDetailVM.videoReplyModel?.nextPageUrl != "") ? Container() :
                            Container(
                              margin: EdgeInsets.only(bottom: 20.px),
                              alignment: Alignment.center,
                              child: Text("-The End-", style: Theme.of(context).textTheme.headline3!.copyWith(color: Colors.white, fontFamily: "Lobster"),),
                            );
                          }
                        },
                        separatorBuilder: (ctx, index) {
                          if (index == 1 || index == 0) {
                            return Container();
                          }
                          return Container(height: 20.px,);
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  _buildListViewTitle(double offset) {
    return Container(
      margin: EdgeInsets.only(top: offset),
      child: Container(
        height: offset > 20.px ? 20.px : offset,
        child: _buildAlphaText("下拉关闭页面", offset > 80+5 ? 80 : offset, 80),
      )
    );
  }

  _buildAlphaText(String string, double offset, double maxOffset) {
    int length = string.length;
    double avgOffset = maxOffset/length;
    List<String> strs = string.split("");
    List<Widget> widgets = strs.asMap().map((key, value) => MapEntry(key, Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.px),
      child: Text(value, style: Theme.of(context).textTheme.headline4!.copyWith(color: Color.fromARGB(offset < key*avgOffset ? 0 : ((offset/(key+1)/avgOffset > 1 ? 1 : (offset-key*avgOffset)/avgOffset)*255).toInt(), 255, 255, 255))),
    ))).values.toList();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: widgets
    );
  }

  _buildVideoDetailContent(ZCLVideoDetailViewModel videoDetailVM) {
    return Container(
      padding: EdgeInsets.fromLTRB(10.px, 10.px, 10.px, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(videoDetailVM.videoBeanModel!.title!, style: Theme.of(context).textTheme.headline3!.copyWith(fontWeight: FontWeight.bold, color: Colors.white),),
          Padding(
            padding: EdgeInsets.only(top: 10.px),
            child: Text("# ${videoDetailVM.videoBeanModel!.category} / 开眼精选", style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white70),),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.px),
            child: Text(videoDetailVM.videoBeanModel!.description!, style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white70),),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.px),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildActionButton(Icons.thumb_up_alt_outlined, videoDetailVM.videoBeanModel!.consumption!.collectionCount!.toString()),
                _buildActionButton(Icons.share_outlined, videoDetailVM.videoBeanModel!.consumption!.shareCount.toString()),
                _buildActionButton(Icons.download_rounded, "缓存"),
                _buildActionButton(Icons.star_border_outlined, "收藏")
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildActionButton(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.white70,),
        SizedBox(width: 5.px,),
        Text(text, style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white70),)
      ]
    );
  }

  _buildAuthorItem(ZCLVideoDetailViewModel videoDetailVM) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.white10))
      ),
      child: ListTile(
        leading: CircleAvatar(foregroundImage: NetworkImage(videoDetailVM.videoBeanModel?.author?.icon ?? videoDetailVM.videoBeanModel?.provider?.icon ?? ""),),
        title: Text(videoDetailVM.videoBeanModel?.author?.name ?? videoDetailVM.videoBeanModel?.provider?.name ?? "", style: Theme.of(context).textTheme.headline3!.copyWith(color: Colors.white),),
        subtitle: Text(
          videoDetailVM.videoBeanModel?.author?.description ?? videoDetailVM.videoBeanModel?.provider?.alias ?? "",
          style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white54),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: _buildAuthorFollowButton(videoDetailVM),
      ),
    );
  }

  _buildAuthorFollowButton(ZCLVideoDetailViewModel videoDetailVM) {
    String followText = videoDetailVM.videoBeanModel!.collected! ? "已关注" : "+关注";
    Color color = videoDetailVM.videoBeanModel!.collected! ? Colors.white24 : Colors.white;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.px),
      decoration: BoxDecoration(
        border: Border.all(color: color),
        borderRadius: BorderRadius.all(Radius.circular(5.px)),
      ),
      child: Text(followText, style: Theme.of(context).textTheme.headline4!.copyWith(color: color)),
    );
  }
  
  _buildSmallVideoItem(RelatedItemList itemModel) {
    Widget smallVideoItem = Container();
    // print("zcl --- itemModel --- ${itemModel.toJson()}");
    if (itemModel.type == ItemListType.VIDEO_SMALL_CARD) {
      if (itemModel.data!.dataType == ContentDataType.VIDEO_BEAN_FOR_CLIENT) {
        smallVideoItem = Container(
          height: 100.px,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(itemModel.data?.cover?.feed ?? "", fit: BoxFit.fill),
                      Positioned(
                        bottom: 2.px,
                        right: 2.px,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 5.px, 5.px),
                          padding: EdgeInsets.symmetric(horizontal: 5.px),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.all(Radius.circular(20.px))
                          ),
                          child: Text(_secondToTimeText(itemModel.data?.duration ?? 0), style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white70),),
                        ),
                      )
                    ]
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 10.px),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(itemModel.data?.title ?? "", style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white, fontWeight: FontWeight.bold),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("# ${itemModel.data?.category ?? ""} / 开眼精选", style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white70),),
                          Icon(Icons.share_outlined, color: Colors.white70,)
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      }
    }
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.px),
      child: GestureDetector(
        onTap: (){
          Provider.of<ZCLVideoDetailNotifier>(context, listen: false).updateVideoId(itemModel.data!.id!.toString());
          Navigator.of(context).pushReplacementNamed(ZCLVideoDetailPage.routeName);
        },
        child: smallVideoItem
      )
    );
  }

  _secondToTimeText(int seconds) {
    var sec = seconds % 60;
    var minute = seconds ~/ 60 % 60;
    var hour = seconds ~/ 60 ~/ 60 % 24;

    return "${minute < 10 ? '0$minute' : minute}:${sec < 10 ? '0$sec' : sec}";
  }

  _buildReplyItem(ReplyItemList item) {
    Widget replyItem = Container();

    if (item.type == "textCard") {
      if (item.data!.dataType == "TextCard") {
        replyItem = Text(item.data!.text!, style: Theme.of(context).textTheme.headline3!.copyWith(color: Colors.white),);
      }
    } else if (item.type == "reply") {
      if (item.data!.dataType == "ReplyBeanForClient") {
        replyItem = Container(
          // height: 90.px,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: CircleAvatar(foregroundImage: NetworkImage(item.data?.user?.avatar ?? ""),)
              ),
              Expanded(
                flex: 9,
                child: Container(
                  padding: EdgeInsets.only(bottom: 5.px),
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.white54))
                  ),
                  margin: EdgeInsets.only(left: 10.px),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(item.data!.user!.nickname!, style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white, fontWeight: FontWeight.bold), maxLines: 1, overflow: TextOverflow.ellipsis,),
                          Spacer(),
                          Text(item.data!.likeCount.toString(), style: Theme.of(context).textTheme.headline3!.copyWith(color: Colors.white),),
                          Padding(
                            padding: EdgeInsets.only(left: 5.px),
                            child: Icon(Icons.thumb_up_alt_outlined, color: Colors.white54,),
                          ),
                        ],
                      ),
                      item.data!.parentReply == null ? Container() : Text("回复 @${item.data!.parentReply!.user}", style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white54,), maxLines: 1, overflow: TextOverflow.ellipsis,),
                      Padding(
                        padding: EdgeInsets.only(top: 5.px),
                        child: Text(item.data!.message!, style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white)),
                      ),
                      (!item.data!.showParentReply! || item.data!.parentReply == null) ? Container() :
                      Container(
                        margin: EdgeInsets.only(top: 5.px),
                        color: Color.fromRGBO(0, 0, 0, .1),
                        child: ListTile(
                          leading: CircleAvatar(foregroundImage: NetworkImage(item.data!.parentReply!.user!.avatar!),),
                          title: Text(item.data!.parentReply!.user!.nickname!, style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white, fontWeight: FontWeight.bold), maxLines: 1, overflow: TextOverflow.ellipsis),
                          subtitle: Text(item.data!.parentReply!.message!, style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white), maxLines: 2, overflow: TextOverflow.ellipsis,),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5.px),
                        child: Row(
                          children: [
                            item.data!.parentReply == null ? Container() :
                            Padding(
                              padding: EdgeInsets.only(right: 30.px),
                              child: Text("查看对话", style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white70)),
                            ),
                            Text("回复", style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white70),),
                            Padding(
                              padding: EdgeInsets.only(left: 30.px),
                              child: Text(_formatTimestamp(item.data!.createTime!), style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white54),),
                            ),
                            Spacer(),
                            Icon(Icons.linear_scale_outlined, color: Colors.white54,)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      }
    }
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.px),
      child: replyItem,
    );
  }
  _formatTimestamp(int time) {
    return formatDate(DateTime.fromMillisecondsSinceEpoch(time), [yyyy,'/',mm,'/',dd]);
  }

  _loadMoreReply() {
    ZCLVideoDetailViewModel vm = Provider.of<ZCLVideoDetailViewModel>(context, listen: false);
    if (vm.videoReplyModel!.nextPageUrl != null && vm.videoReplyModel!.nextPageUrl != "") {
      vm.updateVideoReply(vm.videoReplyModel!.nextPageUrl!);
    }
  }

  _onPointerUp( PointerUpEvent event) {
    if (_topMargin > 100) {
      Navigator.of(context).maybePop();
    }
  }
}
